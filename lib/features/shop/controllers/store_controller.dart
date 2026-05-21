import 'package:get/get.dart';
import 'package:t_store/data/repositories/products/product_repository.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class StoreController extends GetxController {
  static StoreController get instance => Get.find();

  final isLoading = false.obs;
  final _productRepository = Get.put(ProductRepository());

  /// Products currently displayed in the selected category tab
  RxList<ProductModel> categoryProducts = <ProductModel>[].obs;

  /// The currently active tab index
  RxInt selectedTabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // Wait for CategoryController to load, then load the first tab
    ever(CategoryController.instance.featuredCategories, (_) {
      _loadProductsForSelectedTab();
    });
  }

  // ─── Called when a tab is tapped ─────────────────────────────────────────

  void onTabChanged(int index) {
    selectedTabIndex.value = index;
    _loadProductsForSelectedTab();
  }

  // ─── Load products for the current category tab ───────────────────────────

  Future<void> _loadProductsForSelectedTab() async {
    try {
      isLoading.value = true;
      final categories =
          CategoryController.instance.featuredCategories;
      if (categories.isEmpty) return;

      final selectedCategory =
          categories[selectedTabIndex.value.clamp(0, categories.length - 1)];
      final products = await _productRepository.getProductsByCategory(
        categoryId: selectedCategory.id,
        limit: 20,
      );
      categoryProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // ─── Reload for a specific category id ───────────────────────────────────

  Future<void> loadProductsForCategory(String categoryId,
      {int limit = 20}) async {
    try {
      isLoading.value = true;
      final products = await _productRepository.getProductsByCategory(
        categoryId: categoryId,
        limit: limit,
      );
      categoryProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // ─── Search ───────────────────────────────────────────────────────────────

  Future<List<ProductModel>> searchProducts(String query) async {
    try {
      if (query.trim().isEmpty) return [];
      return await _productRepository.searchProducts(query);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // ─── Brands for the active tab category ──────────────────────────────────

  Future<void> loadBrandsForCurrentCategory() async {
    final categories = CategoryController.instance.featuredCategories;
    if (categories.isEmpty) return;
    final selectedCategory =
        categories[selectedTabIndex.value.clamp(0, categories.length - 1)];
    await BrandController.instance
        .getBrandsForCategory(selectedCategory.id);
  }
}
