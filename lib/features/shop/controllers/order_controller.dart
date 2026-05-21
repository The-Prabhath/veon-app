import 'package:get/get.dart';
import 'package:t_store/data/repositories/orders/order_repository.dart';
import 'package:t_store/features/shop/models/order_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final isLoading = false.obs;
  final _orderRepository = OrderRepository.instance;
  RxList<OrderModel> orders = <OrderModel>[].obs;

  @override
  void onInit() {
    fetchUserOrders();
    super.onInit();
  }

  Future<void> fetchUserOrders() async {
    try {
      isLoading.value = true;
      final userOrders = await _orderRepository.fetchUserOrders();
      // Show newest first
      userOrders.sort((a, b) => b.orderDate.compareTo(a.orderDate));
      orders.assignAll(userOrders);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
