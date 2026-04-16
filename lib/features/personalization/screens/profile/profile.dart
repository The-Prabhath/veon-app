import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(
                      image: TImages.user,
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

              /// Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Profile Information
              const TSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                  title: 'Name',
                  value: 'Prabhath Samarathunga',
                  onPressed: () {}),
              TProfileMenu(
                  title: 'Username', value: 'Prabhath', onPressed: () {}),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Personal Information
              const TSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                title: 'User ID',
                value: '5982003',
                icon: Iconsax.copy, // ✅ added copy icon
                onPressed: () {},
              ),
              TProfileMenu(
                  title: 'E-mail',
                  value: 'kavinduprabathkp@gmail.com',
                  onPressed: () {}),
              TProfileMenu(
                  title: 'Phone Number',
                  value: '+94-76-73-88-921',
                  onPressed: () {}),
              TProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              TProfileMenu(
                  title: 'Date of Birth',
                  value: '20 May, 2003',
                  onPressed: () {}),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Close Account Button
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
      ),
    );
  }
}
