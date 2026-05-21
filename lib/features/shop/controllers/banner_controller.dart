import 'package:get/get.dart';
import 'package:t_store/data/repositories/banners/banner_repository.dart';
import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  final isLoading = false.obs;
  final _repo = Get.put(BannerRepository());

  /// Home carousel banners
  RxList<BannerModel> homeBanners = <BannerModel>[].obs;

  /// Cache of category banners  key = categoryId → list of banners
  final Map<String, List<BannerModel>> _categoryBannerCache = {};

  @override
  void onInit() {
    fetchHomeBanners();
    super.onInit();
  }

  Future<void> fetchHomeBanners() async {
    try {
      isLoading.value = true;
      final banners = await _repo.fetchBanners('home');
      homeBanners.assignAll(banners);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Returns banners for a specific category — cached after first load
  Future<List<BannerModel>> getBannersForCategory(String categoryId) async {
    if (_categoryBannerCache.containsKey(categoryId)) {
      return _categoryBannerCache[categoryId]!;
    }
    try {
      final banners = await _repo.fetchBanners(categoryId);
      _categoryBannerCache[categoryId] = banners;
      return banners;
    } catch (_) {
      return [];
    }
  }
}
