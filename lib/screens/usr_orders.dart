import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketapp/globalStates/orders.dart';

import 'package:marketapp/widgets/order_item.dart';

class UserOrders extends ConsumerStatefulWidget {
  const UserOrders({Key? key}) : super(key: key);
  @override
  ConsumerState<UserOrders> createState() => _UserOrders();
}

class _UserOrders extends ConsumerState<UserOrders> {
  @override
  void initState() {
    super.initState();
  }

  var invisibility = true;
  @override
  Widget build(BuildContext context) {
    var orders = ref.watch(ordersProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF5AA9E6),
        title: const Text(
          'Sİparişlerin',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      body: orders.length > 1
          ? ListView(
              children: orders
                  .map((ord) => ord.orderId == "-1"
                      ? ListBody()
                      : OrderItem(orderId: ord.orderId))
                  .toList())
          : const Center(
              child: Text('Henüz hiç siparişiniz yok.'),
            ),
    );
  }
}
