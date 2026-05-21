import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/orders/order_repository.dart';
import 'package:t_store/features/shop/controllers/cart_controller.dart';
import 'package:t_store/features/shop/models/order_model.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final _orderRepository = Get.put(OrderRepository());

  // ─── Pricing constants ────────────────────────────────────────────────────
  static const double shippingFee = 6.0;
  static const double taxRate = 0.02; // 2% tax

  // ─── Selected payment method ──────────────────────────────────────────────
  final selectedPaymentMethod = 'Paypal'.obs;

  // ─── Coupon ───────────────────────────────────────────────────────────────
  final couponCode = ''.obs;
  final couponDiscount = 0.0.obs;
  final isCouponApplied = false.obs;

  // ─── Calculated totals ────────────────────────────────────────────────────

  double get subtotal => CartController.instance.totalCartPrice.value;

  double get taxFee => double.parse((subtotal * taxRate).toStringAsFixed(2));

  double get discount => couponDiscount.value;

  double get orderTotal => subtotal + shippingFee + taxFee - discount;

  // ─── Apply coupon ─────────────────────────────────────────────────────────

  void applyCoupon(String code) {
    if (code.trim().isEmpty) return;
    // Demo coupons — replace with Firestore lookup as needed
    if (code.toUpperCase() == 'VEON10') {
      couponDiscount.value = subtotal * 0.10;
      isCouponApplied.value = true;
      TLoaders.successSnackBar(
          title: 'Coupon Applied', message: '10% discount added!');
    } else if (code.toUpperCase() == 'SAVE5') {
      couponDiscount.value = 5.0;
      isCouponApplied.value = true;
      TLoaders.successSnackBar(
          title: 'Coupon Applied', message: '\$5 discount added!');
    } else {
      isCouponApplied.value = false;
      couponDiscount.value = 0;
      TLoaders.errorSnackBar(
          title: 'Invalid Coupon', message: 'This coupon code is not valid.');
    }
  }

  void removeCoupon() {
    couponCode.value = '';
    couponDiscount.value = 0;
    isCouponApplied.value = false;
  }

  // ─── Place order ─────────────────────────────────────────────────────────

  Future<void> processOrder() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Processing your order...', 'assets/images/animations/loader.json');

      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
            title: 'Not logged in', message: 'Please login to place an order.');
        return;
      }

      // Build the order
      final order = OrderModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        userId: uid,
        status: OrderStatus.processing,
        totalAmount: orderTotal,
        orderDate: DateTime.now(),
        paymentMethod: selectedPaymentMethod.value,
        items: List.from(CartController.instance.cartItems),
      );

      // Save to Firestore
      await _orderRepository.saveOrder(order, uid);

      // Clear cart
      CartController.instance.clearCart();

      TFullScreenLoader.stopLoading();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
