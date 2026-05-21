import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/styles/rounded_container.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/features/personalization/models/address_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.address});

  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = AddressController.instance;

    return Obx(() {
      final isSelected = controller.selectedAddress.value.id == address.id;
      return GestureDetector(
        onTap: () => controller.selectAddress(address),
        child: TRoundedContainer(
          width: double.infinity,
          showBorder: true,
          backgroundColor: isSelected
              ? TColors.primary.withOpacity(0.5)
              : Colors.transparent,
          borderColor: isSelected
              ? Colors.transparent
              : dark ? TColors.darkerGrey : TColors.grey,
          margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
          child: Stack(
            children: [
              /// ✅ tick icon when selected
              Positioned(
                right: 5, top: 0,
                child: Icon(
                  isSelected ? Iconsax.tick_circle5 : null,
                  color: isSelected
                      ? dark ? TColors.light : TColors.dark
                      : null,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Name
                    Text(address.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: TSizes.sm / 2),
                    /// Phone
                    Text(address.phoneNumber,
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: TSizes.sm / 2),
                    /// Full address
                    Text(address.formattedAddress, softWrap: true),
                  ],
                ),
              ),

              /// Delete button
              Positioned(
                right: 0, bottom: 0,
                child: IconButton(
                  icon: const Icon(Iconsax.trash, color: Colors.red, size: 18),
                  onPressed: () => Get.defaultDialog(
                    title: 'Delete Address',
                    middleText: 'Are you sure you want to delete this address?',
                    onConfirm: () {
                      Get.back();
                      controller.deleteAddress(address);
                    },
                    onCancel: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
