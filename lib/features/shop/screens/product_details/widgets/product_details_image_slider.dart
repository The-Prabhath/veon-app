import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:t_store/common/widgets/icons/t_circular_icon.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/features/shop/controllers/wishlist_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductImageSlider extends StatefulWidget {
  const TProductImageSlider({super.key, required this.product});

  final ProductModel product;

  @override
  State<TProductImageSlider> createState() => _TProductImageSliderState();
}

class _TProductImageSliderState extends State<TProductImageSlider> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final wishlistController = WishlistController.instance;

    // Combine thumbnail + extra images
    final images = <String>[
      if (widget.product.thumbnail.isNotEmpty) widget.product.thumbnail,
      ...?widget.product.images,
    ];
    if (images.isEmpty) images.add('');

    return TCurvedEdgesWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            /// ── Main large image ─────────────────────────────────────
            SizedBox(
              height: 400,
              child: Padding(
                padding:
                    const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                  child: images[_selectedIndex].isNotEmpty
                      ? Image.network(
                          images[_selectedIndex],
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) =>
                              const Icon(Icons.image_not_supported, size: 80),
                        )
                      : const Icon(Icons.image_not_supported, size: 80),
                ),
              ),
            ),

            /// ── Thumbnail strip ──────────────────────────────────────
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: TSizes.spaceBtwItems),
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () => setState(() => _selectedIndex = index),
                    child: TRoundedImage(
                      width: 80,
                      backgroundColor: dark ? TColors.dark : TColors.white,
                      border: Border.all(
                        color: _selectedIndex == index
                            ? TColors.primary
                            : Colors.transparent,
                        width: 2,
                      ),
                      padding: const EdgeInsets.all(TSizes.sm),
                      imageUrl: images[index],
                      isNetworkImage: images[index].isNotEmpty,
                    ),
                  ),
                ),
              ),
            ),

            /// ── AppBar with back + reactive wishlist ─────────────────
            TAppBar(
              showBackArrow: true,
              actions: [
                Obx(() {
                  final isWishlisted =
                      wishlistController.isWishlisted(widget.product.id);
                  return TCircularIcon(
                    icon: isWishlisted ? Iconsax.heart5 : Iconsax.heart,
                    color: isWishlisted ? Colors.red : Colors.grey,
                    onPressed: () =>
                        wishlistController.toggleWishlist(widget.product),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
