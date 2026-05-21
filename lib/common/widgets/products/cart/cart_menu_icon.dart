import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/controllers/cart_controller.dart';
import 'package:t_store/features/shop/screens/cart/cart.dart';
import 'package:t_store/utils/constants/colors.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({super.key, this.iconColor, required this.onPressed});

  final Color? iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor ?? (isDark ? Colors.white : Colors.black),
          ),
        ),
        Positioned(
          right: 0,
          child: Obx(() => controller.noOfCartItems.value > 0
              ? Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: isDark ? Colors.white : TColors.black,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      '${controller.noOfCartItems.value}',
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                            color: isDark ? Colors.black : TColors.white,
                            fontSizeFactor: 0.8,
                          ),
                    ),
                  ),
                )
              : const SizedBox()),
        ),
      ],
    );
  }
}
