import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/shop/models/cart_item_model.dart';
import 'package:t_store/utils/constants/enums.dart';

class OrderModel {
  final String id;
  final String userId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final String? deliveryDate;
  final List<CartItemModel> items;

  OrderModel({
    required this.id,
    required this.userId,
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    required this.paymentMethod,
    this.deliveryDate,
    required this.items,
  });

  String get formattedOrderDate =>
      '${orderDate.day}/${orderDate.month}/${orderDate.year}';

  String get statusText {
    switch (status) {
      case OrderStatus.processing:
        return 'Processing';
      case OrderStatus.shipped:
        return 'Shipped';
      case OrderStatus.delivered:
        return 'Delivered';
    }
  }

  Map<String, dynamic> toJson() => {
        'Id': id,
        'UserId': userId,
        'Status': status.toString(),
        'TotalAmount': totalAmount,
        'OrderDate': Timestamp.fromDate(orderDate),
        'PaymentMethod': paymentMethod,
        'DeliveryDate': deliveryDate,
        'Items': items.map((i) => i.toJson()).toList(),
      };

  factory OrderModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return OrderModel(
      id: data['Id'] ?? doc.id,
      userId: data['UserId'] ?? '',
      status: data['Status'] == OrderStatus.shipped.toString()
          ? OrderStatus.shipped
          : data['Status'] == OrderStatus.delivered.toString()
              ? OrderStatus.delivered
              : OrderStatus.processing,
      totalAmount: double.tryParse('${data['TotalAmount'] ?? 0}') ?? 0,
      orderDate: (data['OrderDate'] as Timestamp).toDate(),
      paymentMethod: data['PaymentMethod'] ?? '',
      deliveryDate: data['DeliveryDate'],
      items: (data['Items'] as List<dynamic>?)
              ?.map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
