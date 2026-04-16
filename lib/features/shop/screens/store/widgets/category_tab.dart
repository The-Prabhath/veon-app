import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: const PageStorageKey('categoryTab'),
      slivers: [
        /// 🔹 MAIN CONTENT
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// --- Brands
              ],
            ),
          ),
        ),

        /// 🔥 GRID (IMPORTANT: use SliverGrid, NOT GridView)
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const TProductCardVertical(),
              childCount: 6,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: TSizes.gridViewSpacing,
              crossAxisSpacing: TSizes.gridViewSpacing,
              mainAxisExtent: 288,
            ),
          ),
        ),

        /// spacing
        const SliverToBoxAdapter(
          child: SizedBox(height: TSizes.spaceBtwSections),
        ),
      ],
    );
  }
}
