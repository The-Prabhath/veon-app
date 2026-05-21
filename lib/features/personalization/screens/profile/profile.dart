import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;

    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Obx(() {
        final user = userController.user.value;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// ── Profile Picture ─────────────────────────────────────
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      TCircularImage(
                        image: user.profilePicture.isNotEmpty
                            ? user.profilePicture
                            : TImages.user,
                        isNetworkImage: user.profilePicture.isNotEmpty,
                        width: 80,
                        height: 80,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Change Profile Picture'),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                /// ── Profile Information ──────────────────────────────────
                const TSectionHeading(
                  title: 'Profile Information',
                  showActionButton: false,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),

                TProfileMenu(
                  title: 'Name',
                  value: user.fullName.isNotEmpty ? user.fullName : '-',
                  onPressed: () {},
                ),
                TProfileMenu(
                  title: 'Username',
                  value: user.username.isNotEmpty ? user.username : '-',
                  onPressed: () {},
                ),

                const SizedBox(height: TSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                /// ── Personal Information ─────────────────────────────────
                const TSectionHeading(
                  title: 'Personal Information',
                  showActionButton: false,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),

                TProfileMenu(
                  title: 'User ID',
                  value: user.id.isNotEmpty
                      ? user.id.substring(0, 8).toUpperCase()
                      : '-',
                  icon: Iconsax.copy,
                  onPressed: () {},
                ),
                TProfileMenu(
                  title: 'E-mail',
                  value: user.email.isNotEmpty ? user.email : '-',
                  onPressed: () {},
                ),
                TProfileMenu(
                  title: 'Phone Number',
                  value: user.phoneNumber.isNotEmpty
                      ? user.formattedPhoneNo
                      : '-',
                  onPressed: () {},
                ),
                TProfileMenu(
                  title: 'Gender',
                  value: '-',
                  onPressed: () {},
                ),
                TProfileMenu(
                  title: 'Date of Birth',
                  value: '-',
                  onPressed: () {},
                ),

                const SizedBox(height: TSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                /// ── Close Account ────────────────────────────────────────
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Close Account',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
