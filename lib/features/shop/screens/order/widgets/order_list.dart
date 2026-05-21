import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/styles/rounded_container.dart';
import 'package:t_store/features/shop/controllers/order_controller.dart';
import 'package:t_store/features/shop/models/order_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());

    return Obx(() {
      /// ── Loading ──────────────────────────────────────────────────────
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      /// ── Empty ────────────────────────────────────────────────────────
      if (controller.orders.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Iconsax.shopping_bag, size: 60, color: Colors.grey),
              const SizedBox(height: 16),
              Text('No orders yet',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.grey)),
              const SizedBox(height: 8),
              Text('Your completed orders will appear here.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.grey),
                  textAlign: TextAlign.center),
            ],
          ),
        );
      }

      /// ── Orders list ──────────────────────────────────────────────────
      return ListView.separated(
        shrinkWrap: true,
        itemCount: controller.orders.length,
        separatorBuilder: (_, __) =>
            const SizedBox(height: TSizes.spaceBtwItems),
        itemBuilder: (_, index) =>
            _OrderCard(order: controller.orders[index]),
      );
    });
  }
}

/// ─── Single order card ───────────────────────────────────────────────────────
class _OrderCard extends StatelessWidget {
  const _OrderCard({required this.order});
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    // Status color
    Color statusColor;
    IconData statusIcon;
    switch (order.status) {
      case OrderStatus.delivered:
        statusColor = Colors.green;
        statusIcon = Iconsax.tick_circle;
        break;
      case OrderStatus.shipped:
        statusColor = Colors.blue;
        statusIcon = Iconsax.ship;
        break;
      case OrderStatus.processing:
      default:
        statusColor = TColors.primary;
        statusIcon = Iconsax.ship;
    }

    return TRoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.all(TSizes.md),
      backgroundColor: dark ? TColors.dark : TColors.light,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// ── Row 1: Status + Date + Arrow ────────────────────────────
          Row(
            children: [
              Icon(statusIcon, color: statusColor),
              const SizedBox(width: TSizes.spaceBtwItems / 2),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.statusText,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: statusColor, fontWeightDelta: 1),
                    ),
                    Text(
                      order.formattedOrderDate,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => _showOrderDetail(context, order),
                icon: const Icon(Iconsax.arrow_right_34,
                    size: TSizes.iconSm),
              ),
            ],
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          /// ── Row 2: Order ID + Total ──────────────────────────────────
          Row(
            children: [
              /// Order ID
              Expanded(
                child: Row(
                  children: [
                    const Icon(Iconsax.tag),
                    const SizedBox(width: TSizes.spaceBtwItems / 2),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Order',
                              style:
                                  Theme.of(context).textTheme.labelMedium),
                          Text(
                            '[#${order.id.substring(0, 6)}]',
                            style:
                                Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// Total Amount
              Expanded(
                child: Row(
                  children: [
                    const Icon(Iconsax.dollar_circle),
                    const SizedBox(width: TSizes.spaceBtwItems / 2),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total',
                              style:
                                  Theme.of(context).textTheme.labelMedium),
                          Text(
                            '\$${order.totalAmount.toStringAsFixed(1)}',
                            style:
                                Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          /// ── Items summary ────────────────────────────────────────────
          if (order.items.isNotEmpty) ...[
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            ...order.items.take(2).map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      const Icon(Iconsax.box, size: 14,
                          color: Colors.grey),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          '${item.title} x${item.quantity}',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '\$${(item.price * item.quantity).toStringAsFixed(1)}',
                        style:
                            Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                )),
            if (order.items.length > 2)
              Text(
                '+ ${order.items.length - 2} more items',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: Colors.grey),
              ),
          ],
        ],
      ),
    );
  }

  /// Order detail bottom sheet
  void _showOrderDetail(BuildContext context, OrderModel order) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order Details',
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: TSizes.spaceBtwItems),
            _detailRow(context, 'Order ID',
                '[#${order.id.substring(0, 6)}]'),
            _detailRow(context, 'Date', order.formattedOrderDate),
            _detailRow(context, 'Status', order.statusText),
            _detailRow(context, 'Payment', order.paymentMethod),
            _detailRow(context, 'Total',
                '\$${order.totalAmount.toStringAsFixed(1)}'),
            const Divider(),
            Text('Items',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            ...order.items.map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '${item.title} x${item.quantity}',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                          '\$${(item.price * item.quantity).toStringAsFixed(1)}'),
                    ],
                  ),
                )),
            const SizedBox(height: TSizes.defaultSpace),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(BuildContext context, String label, String value) =>
      Padding(
        padding: const EdgeInsets.only(bottom: TSizes.spaceBtwItems / 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style: Theme.of(context).textTheme.bodyMedium),
            Text(value,
                style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
      );
}
