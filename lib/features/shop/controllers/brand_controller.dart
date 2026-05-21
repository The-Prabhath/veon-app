import 'package:get/get.dart';
import 'package:t_store/data/repositories/brands/brand_repository.dart';
import 'package:t_store/data/repositories/products/product_repository.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  final isLoading = false.obs;
  final _brandRepository = Get.put(BrandRepository());

  RxList<BrandModel> allBrands = <BrandModel>[].obs;
  RxList<BrandModel> featuredBrands = <BrandModel>[].obs;

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  /// Load featured brands
  Future<void> getFeaturedBrands() async {
    try {
      isLoading.value = true;
      final brands = await _brandRepository.getFeaturedBrands();
      featuredBrands.assignAll(brands);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Load all brands
  Future<void> getAllBrands() async {
    try {
      isLoading.value = true;
      final brands = await _brandRepository.getAllBrands();
      allBrands.assignAll(brands);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Get brands filtered by category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      return await _brandRepository.getBrandsForCategory(categoryId);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Fetch products for a specific brand (up to [limit] items)
  Future<List<ProductModel>> getBrandProducts({
    required BrandModel brand,
    int limit = 4,
  }) async {
    try {
      return await ProductRepository.instance.getProductsByBrand(
        brandId: brand.id,
        limit: limit,
      );
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
}
