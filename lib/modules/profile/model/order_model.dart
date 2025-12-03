
import 'package:flutter/material.dart';

import 'order_item_model.dart';

class OrderModel {
  final String id;
  final String title;
  final String location;
  final String imageUrl;
  final bool delivered;
  final String orderedAt;
  final String billTotal;
  final List<OrderItemModel> items;
  final int foodRating;
  final int deliveryRating;
  final OrderStatus status;
  final String? estimatedTime;

  OrderModel({
    required this.id,
    required this.title,
    required this.location,
    required this.imageUrl,
    required this.delivered,
    required this.orderedAt,
    required this.billTotal,
    required this.items,
    this.foodRating = 0,
    this.deliveryRating = 0,
    this.status = OrderStatus.delivered,
    this.estimatedTime,
  });

  OrderModel copyWith({
    String? id,
    String? title,
    String? location,
    String? imageUrl,
    bool? delivered,
    String? orderedAt,
    String? billTotal,
    List<OrderItemModel>? items,
    int? foodRating,
    int? deliveryRating,
    OrderStatus? status,
    String? estimatedTime,
  }) {
    return OrderModel(
      id: id ?? this.id,
      title: title ?? this.title,
      location: location ?? this.location,
      imageUrl: imageUrl ?? this.imageUrl,
      delivered: delivered ?? this.delivered,
      orderedAt: orderedAt ?? this.orderedAt,
      billTotal: billTotal ?? this.billTotal,
      items: items ?? this.items,
      foodRating: foodRating ?? this.foodRating,
      deliveryRating: deliveryRating ?? this.deliveryRating,
      status: status ?? this.status,
      estimatedTime: estimatedTime ?? this.estimatedTime,
    );
  }

  String get statusText {
    switch (status) {
      case OrderStatus.pending:
        return 'Order Placed';
      case OrderStatus.preparing:
        return 'Preparing';
      case OrderStatus.outForDelivery:
        return 'Out for Delivery';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.cancelled:
        return 'Cancelled';
    }
  }

  Color get statusColor {
    switch (status) {
      case OrderStatus.pending:
        return const Color(0xFFFF9800);
      case OrderStatus.preparing:
        return const Color(0xFF2196F3);
      case OrderStatus.outForDelivery:
        return const Color(0xFF9C27B0);
      case OrderStatus.delivered:
        return const Color(0xFF4CAF50);
      case OrderStatus.cancelled:
        return const Color(0xFFF44336);
    }
  }
}

enum OrderStatus { pending, preparing, outForDelivery, delivered, cancelled }
