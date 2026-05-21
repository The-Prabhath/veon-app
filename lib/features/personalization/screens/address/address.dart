import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/features/personalization/screens/address/add_new_address.dart';
import 'package:t_store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: TColors.white),
      ),
      appBar: const TAppBar(showBackArrow: true, title: Text('Addresses')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.allUserAddresses.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: Column(
                    children: [
                      Icon(Iconsax.location, size: 60, color: Colors.grey),
                      SizedBox(height: 16),
                      Text('No addresses yet',
                          style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 8),
                      Text('Tap + to add your delivery address',
                          style: TextStyle(color: Colors.grey),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              );
            }

            return Column(
              children: controller.allUserAddresses
                  .map((addr) => TSingleAddress(address: addr))
                  .toList(),
            );
          }),
        ),
      ),
    );
  }
}
