import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/screens/cart/cart.dart';
import 'package:t_store/utils/constants/colors.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    this.iconColor, // ❌ remove default black
    required this.onPressed,
  });

  final Color? iconColor; // ✅ nullable
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: Icon(
            Iconsax.shopping_bag,

            /// ✅ AUTO color fix
            color: iconColor ?? (isDark ? Colors.white : Colors.black),
          ),
        ),

        /// 🔴 Badge
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: isDark ? Colors.white : TColors.black, // ✅ fix
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: isDark ? Colors.black : TColors.white, // ✅ fix
                      fontSizeFactor: 0.8,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
