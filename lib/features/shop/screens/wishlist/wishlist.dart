import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/icons/t_circular_icon.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/screens/home/home.dart';

import '../../../../utils/constants/sizes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        elevation: 0,
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(() => const HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),

          // ✅ REMOVED COLUMN (clean + no overflow)
          child: TGridLayout(
            itemCount: 6, // match your UI grid
            itemBuilder: (_, index) => const TProductCardVertical(),
          ),
        ),
      ),
    );
  }
}
