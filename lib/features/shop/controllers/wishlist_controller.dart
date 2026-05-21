import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/data/repositories/products/product_repository.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class WishlistController extends GetxController {
  static WishlistController get instance => Get.find();

  /// Set of wishlisted product IDs
  final RxSet<String> wishlistProductIds = <String>{}.obs;

  /// Full product objects for the wishlist screen
  RxList<ProductModel> wishlistProducts = <ProductModel>[].obs;

  // ─── Toggle from product card heart button ────────────────────────────────

  Future<void> toggleWishlist(ProductModel product) async {
    if (wishlistProductIds.contains(product.id)) {
      wishlistProductIds.remove(product.id);
      wishlistProducts.removeWhere((p) => p.id == product.id);
      TLoaders.customToast(message: 'Removed from Wishlist.');
    } else {
      wishlistProductIds.add(product.id);
      wishlistProducts.add(product);
      TLoaders.customToast(message: 'Added to Wishlist.');
    }
  }

  /// Returns true if product is in wishlist
  bool isWishlisted(String productId) => wishlistProductIds.contains(productId);

  /// Fetch full product objects for wishlist (e.g. on app resume)
  Future<void> fetchWishlistProducts() async {
    try {
      final repo = ProductRepository.instance;
      final products = await Future.wait(
        wishlistProductIds.map((id) => repo.getProductById(id)),
      );
      wishlistProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
