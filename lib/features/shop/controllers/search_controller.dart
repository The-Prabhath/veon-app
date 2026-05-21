import 'package:get/get.dart';
import 'package:t_store/data/repositories/products/product_repository.dart';
import 'package:t_store/features/shop/models/product_model.dart';

class TSearchController extends GetxController {
  static TSearchController get instance => Get.find();

  final isLoading = false.obs;
  final searchQuery = ''.obs;
  RxList<ProductModel> searchResults = <ProductModel>[].obs;
  RxList<ProductModel> allProducts = <ProductModel>[].obs;

  final _productRepository = ProductRepository.instance;

  @override
  void onInit() {
    _loadAllProducts();
    super.onInit();
  }

  /// Load all products once for local filtering (fast search)
  Future<void> _loadAllProducts() async {
    try {
      final products = await _productRepository.getAllFeaturedProducts();
      allProducts.assignAll(products);
    } catch (_) {}
  }

  /// Called on every keystroke
  void onSearchChanged(String query) {
    searchQuery.value = query;

    if (query.trim().isEmpty) {
      searchResults.clear();
      return;
    }

    // Local filter — instant, no extra Firestore reads
    final q = query.toLowerCase();
    final filtered = allProducts.where((p) {
      return p.title.toLowerCase().contains(q) ||
          (p.brand?.name.toLowerCase().contains(q) ?? false) ||
          (p.description?.toLowerCase().contains(q) ?? false);
    }).toList();

    searchResults.assignAll(filtered);
  }

  /// Remote search via Firestore (used as fallback for deeper results)
  Future<void> searchFromFirestore(String query) async {
    if (query.trim().isEmpty) return;
    try {
      isLoading.value = true;
      final results = await _productRepository.searchProducts(query);
      searchResults.assignAll(results);
    } catch (_) {
    } finally {
      isLoading.value = false;
    }
  }

  void clearSearch() {
    searchQuery.value = '';
    searchResults.clear();
  }
}
