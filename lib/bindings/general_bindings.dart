import 'package:get/get.dart';
import 'package:t_store/data/repositories/address/address_repository.dart';
import 'package:t_store/data/repositories/banners/banner_repository.dart';
import 'package:t_store/data/repositories/brands/brand_repository.dart';
import 'package:t_store/data/repositories/categories/category_repository.dart';
import 'package:t_store/data/repositories/orders/order_repository.dart';
import 'package:t_store/data/repositories/products/product_repository.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/features/shop/controllers/banner_controller.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/features/shop/controllers/cart_controller.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/controllers/checkout_controller.dart';
import 'package:t_store/features/shop/controllers/order_controller.dart';
import 'package:t_store/features/shop/controllers/product/product_controller.dart';
import 'package:t_store/features/shop/controllers/product/variation_controller.dart';
import 'package:t_store/features/shop/controllers/search_controller.dart';
import 'package:t_store/features/shop/controllers/store_controller.dart';
import 'package:t_store/features/shop/controllers/wishlist_controller.dart';
import 'package:t_store/utils/network/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(ProductRepository());
    Get.put(CategoryRepository());
    Get.put(BrandRepository());
    Get.put(BannerRepository());
    Get.put(OrderRepository());
    Get.put(AddressRepository());
    Get.put(CategoryController());
    Get.put(BrandController());
    Get.put(ProductController());
    Get.put(VariationController());
    Get.put(StoreController());
    Get.put(CartController());
    Get.put(WishlistController());
    Get.put(TSearchController());
    Get.put(CheckoutController());
    Get.put(AddressController());
    Get.put(OrderController());
    Get.put(BannerController());
  }
}
