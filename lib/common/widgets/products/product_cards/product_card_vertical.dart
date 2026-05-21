import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/styles/rounded_container.dart';
import 'package:t_store/common/styles/shadows.dart';
import 'package:t_store/common/widgets/icons/t_circular_icon.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/features/shop/controllers/cart_controller.dart';
import 'package:t_store/features/shop/controllers/product/product_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/screens/product_details/product_detail.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/features/shop/controllers/wishlist_controller.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final productController = ProductController.instance;
    final cartController = CartController.instance;
    final wishlistController = WishlistController.instance;
    final dark = THelperFunctions.isDarkMode(context);

    final salePercentage = productController.calculateSalePercentage(
      product.price,
      product.salePriceDouble > 0 ? product.salePriceDouble : null,
    );

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ── IMAGE ────────────────────────────────────────────────
            TRoundedContainer(
              height: 190,
              padding: EdgeInsets.zero,
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// Thumbnail
                  TRoundedImage(
                    imageUrl: product.thumbnail,
                    isNetworkImage: true,
                    applyImageRadius: true,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),

                  /// Sale badge
                  if (salePercentage != null)
                    Positioned(
                      top: 12,
                      left: 8,
                      child: TRoundedContainer(
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
                    ),

                  /// ❤️ Wishlist button — reactive
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Obx(() {
                      final isWishlisted =
                          wishlistController.isWishlisted(product.id);
                      return TCircularIcon(
                        icon: isWishlisted
                            ? Iconsax.heart5 // filled
                            : Iconsax.heart, // outline
                        color: isWishlisted ? Colors.red : Colors.grey,
                        onPressed: () =>
                            wishlistController.toggleWishlist(product),
                      );
                    }),
                  ),
                ],
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems / 2),

            /// ── DETAILS ──────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: product.title, smallSize: true),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  if (product.brand != null)
                    Row(
                      children: [
                        Text(product.brand!.name,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelMedium),
                        const SizedBox(width: TSizes.xs),
                        const Icon(Iconsax.verify5,
                            color: TColors.primary, size: TSizes.iconXs),
                      ],
                    ),
                ],
              ),
            ),

            const Spacer(),

            /// ── PRICE + ADD TO CART ──────────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.sm),
                  child: TProductPriceText(
                      price: productController.getProductPrice(product)),
                ),

                /// ➕ Add to cart directly
                GestureDetector(
                  onTap: () => cartController.addOneToCart(product),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: TColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TSizes.cardRadiusMd),
                        bottomRight: Radius.circular(TSizes.productImageRadius),
                      ),
                    ),
                    child: const SizedBox(
                      width: TSizes.iconLg * 1.2,
                      height: TSizes.iconLg * 1.2,
                      child: Center(
                          child: Icon(Iconsax.add, color: TColors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
