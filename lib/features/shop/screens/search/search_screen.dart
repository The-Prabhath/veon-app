import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/controllers/search_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TSearchController());
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
          child: TextField(
            autofocus: true,
            onChanged: controller.onSearchChanged,
            onSubmitted: controller.searchFromFirestore,
            decoration: InputDecoration(
              hintText: 'Search products, brands...',
              prefixIcon: const Icon(Iconsax.search_normal),
              suffixIcon: Obx(() => controller.searchQuery.value.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        controller.clearSearch();
                        // Also clear text field
                        FocusScope.of(context).unfocus();
                      },
                    )
                  : const SizedBox()),
              filled: true,
              fillColor: dark ? TColors.darkerGrey : TColors.light,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: TSizes.md),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
        ],
      ),

      body: Obx(() {
        /// ── Loading ──────────────────────────────────────────────────────
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        /// ── Empty query ──────────────────────────────────────────────────
        if (controller.searchQuery.value.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Iconsax.search_normal,
                    size: 60, color: Colors.grey.shade400),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(
                  'Search for products or brands',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.grey),
                ),
              ],
            ),
          );
        }

        /// ── No results ───────────────────────────────────────────────────
        if (controller.searchResults.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Iconsax.emoji_sad, size: 60, color: Colors.grey.shade400),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(
                  'No results for "${controller.searchQuery.value}"',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.grey),
                ),
              ],
            ),
          );
        }

        /// ── Results grid ─────────────────────────────────────────────────
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${controller.searchResults.length} results for "${controller.searchQuery.value}"',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                TGridLayout(
                  itemCount: controller.searchResults.length,
                  itemBuilder: (_, index) => TProductCardVertical(
                    product: controller.searchResults[index],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
