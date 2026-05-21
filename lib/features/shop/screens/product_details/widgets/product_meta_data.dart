import 'package:flutter/material.dart';
import 'package:t_store/common/styles/rounded_container.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:t_store/features/shop/controllers/product/product_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;

    final salePercentage = controller.calculateSalePercentage(
      product.price,
      product.salePriceDouble > 0 ? product.salePriceDouble : null,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// ── Price Row ─────────────────────────────────────────────────
        Row(
          children: [
            /// Sale tag — only if on sale
            if (salePercentage != null) ...[
              TRoundedContainer(
                radius: TSizes.sm,
                backgroundColor: TColors.secondary.withOpacity(0.8),
                padding: const EdgeInsets.symmetric(
                    horizontal: TSizes.sm, vertical: TSizes.xs),
                child: Text(
                  salePercentage,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.black),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              /// Original price struck through
              Text(
                '\$${product.price.toStringAsFixed(0)}',
                style: Theme.of(context).textTheme.titleSmall!.apply(
                      decoration: TextDecoration.lineThrough,
                    ),
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
            ],

            /// Effective price (sale or regular)
            TProductPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            ),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        /// ── Title ─────────────────────────────────────────────────────
        TProductTitleText(title: product.title),

        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        /// ── Stock Status ──────────────────────────────────────────────
        Row(
          children: [
            const TProductTitleText(title: 'Status'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              controller.getProductStockStatus(product.stock),
              style: Theme.of(context).textTheme.titleMedium!.apply(
                    color: product.stock > 0 ? Colors.green : Colors.red,
                  ),
            ),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        /// ── Brand ─────────────────────────────────────────────────────
        if (product.brand != null)
          Row(
            children: [
              TCircularImage(
                image: product.brand!.image.isNotEmpty
                    ? product.brand!.image
                    : TImages.veonIcon,
                isNetworkImage: product.brand!.image.isNotEmpty,
                width: 32,
                height: 32,
                overlayColor: darkMode ? TColors.white : TColors.black,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              TBrandTitleWithVerifiedIcon(
                title: product.brand!.name,
                brandTextSize: TextSizes.medium,
              ),
            ],
          ),
      ],
    );
  }
}
