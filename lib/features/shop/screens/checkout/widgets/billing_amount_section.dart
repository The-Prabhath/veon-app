import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/checkout_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;

    return Obx(() {
      return Column(
        children: [
          _row(context, 'Subtotal',
              '\$${controller.subtotal.toStringAsFixed(1)}'),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          _row(context, 'Shipping Fee',
              '\$${CheckoutController.shippingFee.toStringAsFixed(1)}',
              isLabel: true),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          _row(context, 'Tax (2%)',
              '\$${controller.taxFee.toStringAsFixed(1)}',
              isLabel: true),
          if (controller.isCouponApplied.value) ...[
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            _row(context, 'Discount',
                '-\$${controller.discount.toStringAsFixed(1)}',
                isLabel: true, color: Colors.green),
          ],
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          _row(context, 'Order Total',
              '\$${controller.orderTotal.toStringAsFixed(1)}',
              isBold: true),
        ],
      );
    });
  }

  Widget _row(BuildContext context, String label, String value,
      {bool isLabel = false, bool isBold = false, Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
        Text(
          value,
          style: isBold
              ? Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: color)
              : Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: color),
        ),
      ],
    );
  }
}
