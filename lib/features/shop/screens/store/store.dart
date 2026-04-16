import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/tabbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:t_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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

                /// 🔹 HEADER
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      SizedBox(height: TSizes.spaceBtwItems),

                      /// 🔍 Search
                      TSearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                ),

                /// 🔻 TAB BAR
                bottom: const TTabBar(
                  tabs: [
                    Tab(child: Text('Men')),
                    Tab(child: Text('Women')),
                    Tab(child: Text('Accessories')),
                    Tab(child: Text('Gift Cards')),
                    Tab(child: Text('Final Sale')),
                  ],
                ),
              ),
            ];
          },

          /// 🔥 TAB CONTENT
          body: const TabBarView(
            children: [
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
