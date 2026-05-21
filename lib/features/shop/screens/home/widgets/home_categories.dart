import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/screens/sub_category/sub_categories.dart';
import 'package:t_store/utils/constants/colors.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance;

    return Obx(() {
      if (categoryController.isLoading.value) {
        return const SizedBox(
          height: 80,
          child: Center(child: CircularProgressIndicator(color: TColors.white)),
        );
      }

      if (categoryController.featuredCategories.isEmpty) {
        return const SizedBox(
          height: 80,
          child: Center(
              child: Text('No Categories Found',
                  style: TextStyle(color: TColors.white))),
        );
      }

      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return TVerticalImageText(
              image: category.image.isNotEmpty
                  ? category.image
                  : 'https://img.icons8.com/ios/100/category.png',
              title: category.name,
              isNetworkImage: true,
              onTap: () => Get.to(          // ✅ passes real category
                () => SubCategoriesScreen(category: category),
              ),
            );
          },
        ),
      );
    });
  }
}
