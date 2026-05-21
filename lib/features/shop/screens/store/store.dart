import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/tabbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/loaders/animation_loader.dart';
import 'package:t_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/controllers/store_controller.dart';
import 'package:t_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance;
    final storeController = StoreController.instance;

    return Obx(() {
      /// ── Loading ───────────────────────────────────────────────────────
      if (categoryController.isLoading.value) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }

      /// ── No categories ─────────────────────────────────────────────────
      if (categoryController.featuredCategories.isEmpty) {
        return const Scaffold(
          body: Center(child: Text('No categories found')),
        );
      }

      final categories = categoryController.featuredCategories;

      return DefaultTabController(
        length: categories.length,
        child: Scaffold(
          /// 🔝 APP BAR
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'Store',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            actions: [
              TCartCounterIcon(onPressed: () {}),
              const SizedBox(width: 8),
            ],
          ),

          /// 🧱 BODY
          body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  expandedHeight: 180,
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? TColors.black
                      : TColors.white,

                  /// 🔍 Search
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        SizedBox(height: TSizes.spaceBtwItems),
                        TSearchContainer(
                          text: 'Search in Store',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                  ),

                  /// 🔻 Dynamic TAB BAR from Firestore categories
                  bottom: TTabBar(
                    tabs: categories
                        .map((cat) => Tab(child: Text(cat.name)))
                        .toList(),
                  ),
                ),
              ];
            },

            /// 🔥 TAB CONTENT — one TCategoryTab per category
            body: TabBarView(
              children: categories.asMap().entries.map((entry) {
                return TCategoryTab(
                  categoryId: entry.value.id,
                );
              }).toList(),
            ),
          ),
        ),
      );
    });
  }
}
