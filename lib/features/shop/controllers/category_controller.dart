import 'package:get/get.dart';
import 'package:t_store/data/repositories/categories/category_repository.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());

  /// All categories fetched from Firestore
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;

  /// Filtered featured categories
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// Load categories from Firestore
  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;

      final categories = await _categoryRepository.getAllCategories();
      allCategories.assignAll(categories);

      // Filter: top-level featured categories only
      featuredCategories.assignAll(
        allCategories
            .where((c) => c.parentId.isEmpty && c.isFeatured)
            .take(8)
            .toList(),
      );
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Return all sub-categories for a given parent category
  List<CategoryModel> getSubCategories(String categoryId) {
    return allCategories
        .where((c) => c.parentId == categoryId)
        .toList();
  }
}
