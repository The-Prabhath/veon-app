import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/brand/brand_card.dart';
import 'package:t_store/utils/constants/sizes.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text('Nike'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              TBrandCard(showBorder: true),

              SizedBox(height: TSizes.spaceBtwSections),

              /// Products
              TSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
