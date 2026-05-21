import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/features/personalization/screens/address/address.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;

    return Obx(() {
      final address = addressController.selectedAddress.value;
      final hasAddress = address.id.isNotEmpty;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TSectionHeading(
            title: 'Shipping Address',
            buttonTitle: 'Change',
            onPressed: () => Get.to(() => const UserAddressScreen()),
          ),

          if (hasAddress) ...[
            Text(address.name,
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Row(
              children: [
                const Icon(Icons.phone, color: Colors.grey, size: 16),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text(address.phoneNumber,
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Row(
              children: [
                const Icon(Icons.location_on_outlined,
                    color: Colors.grey, size: 16),
                const SizedBox(width: TSizes.spaceBtwItems),
                Expanded(
                  child: Text(address.formattedAddress,
                      style: Theme.of(context).textTheme.bodyMedium,
                      softWrap: true),
                ),
              ],
            ),
          ] else
            GestureDetector(
              onTap: () => Get.to(() => const UserAddressScreen()),
              child: Text(
                'Add a shipping address',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.blue),
              ),
            ),
        ],
      );
    });
  }
}
