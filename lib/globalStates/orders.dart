import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketapp/files/ordersFile.dart';
import 'dart:io';
import 'dart:developer';

final ordersProvider = StateNotifierProvider<OrderNotifier, List<Order>>((ref) {
  return OrderNotifier(orders: [
    Order(
      orderId: "-1",
      prdId: ["1", "2"],
      total: "1",
      date: DateTime(2017, 9, 7, 17, 30),
      orderDetail: 'debug',
      stance: '1',
    ),
  ]);
});

@immutable
class Order {
  final String orderId;
  final List prdId; // 'product' must be
  final String total;
  final DateTime date;
  final String orderDetail;
  final String stance;

  const Order({
    required this.orderId,
    required this.prdId,
    required this.total,
    required this.date,
    required this.orderDetail,
    required this.stance,
  });

  Order copyWith({
    String? orderId,
    List? prdId,
    String? total,
    DateTime? date,
    String? orderDetail,
    String? stance,
  }) {
    return Order(
      orderId: orderId ?? this.orderId,
      prdId: prdId ?? this.prdId,
      total: total ?? this.total,
      date: date ?? this.date,
      orderDetail: orderDetail ?? this.orderDetail,
      stance: stance ?? this.stance,
    );
  }
}

class OrderNotifier extends StateNotifier<List<Order>> {
  OrderNotifier({orders}) : super(orders);

  void add(Order order) {
    state = [...state, order];
    writeFile(order);
    readFile();
  }

  void writeFile(Order order) async {
    FileUtils.saveToFile(order);
  }

  void readFile() async {
    FileUtils.readFromFile().then((value) => debugPrint(value));
  }
}
