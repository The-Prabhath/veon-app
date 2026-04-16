import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed; // ✅ store it

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImage(
        image: TImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        'Prabhath Samarathunga',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        'kavinduprabathkp@gmail.com',
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),

      // ✅ FIXED BUTTON
      trailing: IconButton(
        onPressed: onPressed, // 🔥 NOW IT WORKS
        icon: const Icon(
          Iconsax.edit,
          color: TColors.white,
        ),
      ),
    );
  }
}
