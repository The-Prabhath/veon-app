import 'package:flutter/material.dart';
import 'package:t_store/common/styles/rounded_container.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    this.onTap,
    required this.showBorder,
  });

  final bool showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            /// 🔘 Brand Image
            TCircularImage(
              isNetworkImage: false,
              image: TImages.veonIcon,
              width: 40,
              height: 40,
              padding: 8,
              backgroundColor: Colors.transparent,
              overlayColor: THelperFunctions.isDarkMode(context)
                  ? TColors.white
                  : TColors.black,
            ),

            const SizedBox(width: 8),

            /// 📝 Brand Info
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TBrandTitleWithVerifiedIcon(
                    title: 'Nike',
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '256 products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
