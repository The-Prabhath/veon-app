import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/controllers/product/product_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.categoryId});

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;

    return FutureBuilder<List<ProductModel>>(
      future: controller.fetchProductsByCategory(categoryId: categoryId),
      builder: (context, snapshot) {
        /// ── Loading ────────────────────────────────────────────────────
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        /// ── Error ──────────────────────────────────────────────────────
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final products = snapshot.data ?? [];

        /// ── Empty ──────────────────────────────────────────────────────
        if (products.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Text(
                'No products in this category yet.',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        /// ── Product Grid ───────────────────────────────────────────────
        return CustomScrollView(
          key: PageStorageKey(categoryId),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      TProductCardVertical(product: products[index]),
                  childCount: products.length,
                ),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: TSizes.gridViewSpacing,
                  crossAxisSpacing: TSizes.gridViewSpacing,
                  mainAxisExtent: 288,
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: TSizes.spaceBtwSections),
            ),
          ],
        );
      },
    );
  }
}
