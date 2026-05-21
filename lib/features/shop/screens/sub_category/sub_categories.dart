import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/banner_controller.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/controllers/product/product_controller.dart';
import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance;
    final productController = ProductController.instance;
    final bannerController = BannerController.instance;
    final subCategories = categoryController.getSubCategories(category.id);

    return Scaffold(
      appBar: TAppBar(title: Text(category.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// ── Dynamic banner for this category ──────────────────
              FutureBuilder<List<BannerModel>>(
                future: bannerController.getBannersForCategory(category.id),
                builder: (context, snapshot) {
                  final banners = snapshot.data ?? [];

                  if (banners.isNotEmpty) {
                    /// Firestore banner
                    return Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            banners[0].imageUrl,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => _fallbackBanner(),
                          ),
                        ),
                        if (banners.length > 1)
                          Padding(
                            padding: const EdgeInsets.only(top: TSizes.sm),
                            child: Row(
                              children: banners
                                  .skip(1)
                                  .take(2)
                                  .map((b) => Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: TSizes.sm),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Image.network(
                                              b.imageUrl,
                                              height: 100,
                                              fit: BoxFit.cover,
                                              errorBuilder: (_, __, ___) =>
                                                  _fallbackBanner(height: 100),
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                      ],
                    );
                  }

                  /// Fallback to default asset banner
                  return _fallbackBanner();
                },
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              /// ── Products ─────────────────────────────────────────
              if (subCategories.isNotEmpty)
                ...subCategories.map(
                  (sub) => _SubCategorySection(
                    subCategory: sub,
                    productController: productController,
                  ),
                )
              else
                _SubCategorySection(
                  subCategory: category,
                  productController: productController,
                  title: 'All Products',
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fallbackBanner({double height = 200}) => TRoundedImage(
        width: double.infinity,
        height: height,
        imageUrl: TImages.promoBanner1,
        applyImageRadius: true,
        fit: BoxFit.cover,
      );
}

class _SubCategorySection extends StatelessWidget {
  const _SubCategorySection({
    required this.subCategory,
    required this.productController,
    this.title,
  });

  final CategoryModel subCategory;
  final ProductController productController;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: productController.fetchProductsByCategory(
          categoryId: subCategory.id, limit: 4),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        final products = snapshot.data ?? [];
        if (products.isEmpty) return const SizedBox();

        return Column(
          children: [
            TSectionHeading(
              title: title ?? subCategory.name,
              onPressed: () => Get.to(() => AllProducts(
                    categoryId: subCategory.id,
                    title: title ?? subCategory.name,
                  )),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            SizedBox(
              height: 120,
              child: ListView.separated(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, __) =>
                    const SizedBox(width: TSizes.spaceBtwItems),
                itemBuilder: (_, index) =>
                    TProductCardHorizontal(product: products[index]),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
          ],
        );
      },
    );
  }
}
