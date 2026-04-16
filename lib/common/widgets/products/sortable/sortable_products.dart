import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// 🔽 Dropdown
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
            border: OutlineInputBorder(),
          ),
          value: 'Name',
          onChanged: (value) {},
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) => DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  ))
              .toList(),
        ),

        const SizedBox(height: 16), // TSizes.spaceBtwSections

        /// 🛍 Products Grid
        GridView.builder(
          itemCount: 8,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio:
                  0.75 // try 0.75 or 0.8 instead of 0.7 // control card height
              ),
          itemBuilder: (_, index) => const TProductCardVertical(),
        ),
      ],
    );
  }
}
