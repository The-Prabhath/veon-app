import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;

    return Obx(() {
      final user = userController.user.value;
      return ListTile(
        leading: TCircularImage(
          image: user.profilePicture.isNotEmpty
              ? user.profilePicture
              : TImages.user,
          isNetworkImage: user.profilePicture.isNotEmpty,
          width: 50,
          height: 50,
          padding: 0,
        ),
        title: Text(
          userController.fullName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TColors.white),
        ),
        subtitle: Text(
          userController.email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: TColors.white),
        ),
        trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(Iconsax.edit, color: TColors.white),
        ),
      );
    });
  }
}
