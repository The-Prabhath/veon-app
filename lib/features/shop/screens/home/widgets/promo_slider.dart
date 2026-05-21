import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/circular_cotainer.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/features/shop/controllers/banner_controller.dart';
import 'package:t_store/features/shop/controllers/home_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    final bannerController = BannerController.instance;

    return Obx(() {
      /// Loading
      if (bannerController.isLoading.value) {
        return const SizedBox(
          height: 200,
          child: Center(child: CircularProgressIndicator()),
        );
      }

      /// Use Firestore banners if available, else fallback to local assets
      final banners = bannerController.homeBanners.isNotEmpty
          ? bannerController.homeBanners.map((b) => b.imageUrl).toList()
          : [TImages.promoBanner1, TImages.promoBanner2, TImages.promoBanner3];

      final isNetwork = bannerController.homeBanners.isNotEmpty;

      return Column(
        children: [
          /// Carousel
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              onPageChanged: (index, _) =>
                  homeController.updatePageIndicator(index),
            ),
            items: banners
                .map((url) => TRoundedImage(
                      imageUrl: url,
                      isNetworkImage: isNetwork,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      applyImageRadius: true,
                    ))
                .toList(),
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          /// Dot indicators
          Center(
            child: Obx(
              () => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < banners.length; i++)
                    TCircularContainer(
                      width: 20,
                      height: 4,
                      margin: const EdgeInsets.only(right: 10),
                      backgroundColor:
                          homeController.carouselCurrentIndex.value == i
                              ? TColors.primary
                              : TColors.grey,
                    ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
