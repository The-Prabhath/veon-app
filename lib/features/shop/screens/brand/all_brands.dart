import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/brand/brand_card.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/brand/brand_products.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brand'),
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // TSizes.defaultSpace
          child: Column(
            children: [
              /// Heading
              const TSectionHeading(
                title: 'Brands',
                showActionButton: false,
              ),

              const SizedBox(height: 16), // TSizes.spaceBtwItems

              /// Brands Grid
              TGridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (context, index) => TBrandCard(
                  showBorder: true,
                  onTap: () => Get.to(() => const BrandProducts()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
