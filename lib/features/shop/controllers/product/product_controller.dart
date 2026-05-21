import 'package:get/get.dart';
import 'package:t_store/data/repositories/products/product_repository.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final _productRepository = Get.put(ProductRepository());

  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  // ─── Featured products (home page carousel / grid) ───────────────────────

  Future<void> fetchFeaturedProducts() async {
    try {
      isLoading.value = true;
      final products = await _productRepository.getFeaturedProducts();
      featuredProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // ─── Products by category (store tab) ────────────────────────────────────

  Future<List<ProductModel>> fetchProductsByCategory({
    required String categoryId,
    int limit = -1,
  }) async {
    try {
      return await _productRepository.getProductsByCategory(
        categoryId: categoryId,
        limit: limit,
      );
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // ─── All featured products (all products screen) ─────────────────────────

  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      return await _productRepository.getAllFeaturedProducts();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // ─── Sale price display helper ────────────────────────────────────────────

  /// Returns the price string to show (strikethrough original + sale price,
  /// or just the regular price).
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // For simple products
    if (product.productType == null ||
        product.productVariations == null ||
        product.productVariations!.isEmpty) {
      return (product.salePrice != null && product.salePrice!.isNotEmpty)
          ? product.salePrice!
          : product.price.toString();
    }

    // For variable products — find the price range across variations
    for (final variation in product.productVariations!) {
      double priceToConsider;
      if (variation.salePrice.isNotEmpty &&
          double.tryParse(variation.salePrice) != null &&
          double.parse(variation.salePrice) > 0) {
        priceToConsider = double.parse(variation.salePrice);
      } else {
        priceToConsider = double.tryParse(variation.price) ?? 0;
      }

      if (priceToConsider < smallestPrice) smallestPrice = priceToConsider;
      if (priceToConsider > largestPrice) largestPrice = priceToConsider;
    }

    if (smallestPrice == largestPrice) {
      return largestPrice.toStringAsFixed(1);
    }

    return '\$${smallestPrice.toStringAsFixed(1)} - \$${largestPrice.toStringAsFixed(1)}';
  }

  /// Returns the sale percentage off to show on the product badge.
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0) return null;
    if (originalPrice <= 0) return null;
    final percentage =
        ((originalPrice - salePrice) / originalPrice) * 100;
    return '${percentage.round()}%';
  }

  /// Readable stock status label
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
