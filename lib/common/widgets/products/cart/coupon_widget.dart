import 'package:flutter/material.dart';
import 'package:t_store/common/styles/rounded_container.dart';
import 'package:t_store/features/shop/controllers/checkout_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TCouponCode extends StatefulWidget {
  const TCouponCode({super.key, required this.controller});
  final CheckoutController controller;

  @override
  State<TCouponCode> createState() => _TCouponCodeState();
}

class _TCouponCodeState extends State<TCouponCode> {
  final _textController = TextEditingController();

  @override
  void dispose() { _textController.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.only(top: TSizes.sm, bottom: TSizes.sm, right: TSizes.sm, left: TSizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here',
                border: InputBorder.none, focusedBorder: InputBorder.none, enabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () => widget.controller.applyCoupon(_textController.text),
              style: ElevatedButton.styleFrom(
                foregroundColor: dark ? TColors.white.withOpacity(0.5) : TColors.dark.withOpacity(0.5),
                backgroundColor: TColors.grey.withOpacity(0.2),
                side: BorderSide(color: TColors.grey.withOpacity(0.1)),
                elevation: 0,
              ),
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
