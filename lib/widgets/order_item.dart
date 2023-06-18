import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:marketapp/globalStates/orders.dart';
import 'package:marketapp/util/products.dart';

class OrderItem extends ConsumerStatefulWidget {
  const OrderItem({Key? key, required this.orderId}) : super(key: key);
  final String orderId;

  @override
  ConsumerState createState() => _OrderItem();
}

class _OrderItem extends ConsumerState<OrderItem> {
  @override
  void initState() {
    super.initState();
  }

  var isOk;
  var order;
  var orderProducts = [];
  var orderDate;
  getOrder() {
    var orders = ref.watch(ordersProvider);
    orderProducts = [];
    order = [];
    orders.forEach((element) {
      if (element.orderId == widget.orderId) {
        order = element;
        element.prdId.forEach((o) => {
              products.forEach(
                  (p) => {p['id'] == o ? orderProducts.add(p) : false}),
            });
      }
    });
    orderDate = order.date.day.toString() +
        "/" +
        order.date.month.toString() +
        "/" +
        order.date.year.toString();
  }

  String dar = DateTime.now().day.toString();

  @override
  Widget build(BuildContext context) {
    getOrder();
    var orders = ref.watch(ordersProvider);
    return GestureDetector(
      onTap: () {
        //Go to order detail.
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            padding: EdgeInsets.all(15),

            //height: 230.0,
            width: MediaQuery.of(context).size.width - 30,
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1.50,
                ),
              ),
            ),
            constraints: BoxConstraints(
              minHeight: 200.0,
              maxHeight: 230.0,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(children: [
                          Text(orderDate),
                          Text('Toplam: 227.98'),
                        ]),
                        TextButton(
                          onPressed: () {},
                          child: Text('Detaylar'),
                        ),
                      ],
                    )),
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: Container(
                      height: 60,
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getStance(context),
                          Wrap(
                            spacing: 5,
                            runSpacing: 5,
                            children: orderProducts
                                .map(
                                  (e) => Image.asset(
                                    e['img'],
                                    height: 70,
                                    width: 70,
                                    fit: BoxFit.cover,
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      )),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Row(
                    children: [
                      Text(order.orderDetail),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  getStance(BuildContext context) {
    switch (order.stance) {
      case '1':
        return Row(
          children: const [
            Icon(Icons.av_timer_outlined),
            Text(
              'sipariş Alı ndı',
              style: TextStyle(fontSize: 13.0, color: Colors.black),
            ),
          ],
        );
      case "2":
        return Row(
          children: const [
            Icon(Icons.mode_of_travel_rounded),
            Text(
              'Yola çıktı',
              style: TextStyle(fontSize: 13.0, color: Colors.black),
            ),
          ],
        );

      case "3":
        return Row(
          children: const [
            Icon(Icons.task_alt_rounded),
            Text(
              'Teslim edildi',
              style: TextStyle(fontSize: 13.0, color: Colors.black),
            ),
          ],
        );

      case "4":
        return Row(
          children: const [
            Icon(Icons.do_not_disturb_on_outlined),
            Text(
              'iptal edildi',
              style: TextStyle(fontSize: 13.0, color: Colors.black),
            ),
          ],
        );
      default:
    }
  }
}
