import 'package:flutter/material.dart';
import 'package:marketapp/globalStates/basket.dart';
import 'package:marketapp/globalStates/orders.dart';

import 'package:marketapp/util/products.dart';
import 'package:marketapp/widgets/basket_item.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasketPage extends ConsumerStatefulWidget {
  const BasketPage({Key? key}) : super(key: key);
  @override
  ConsumerState createState() => _BasketPage();
}

class _BasketPage extends ConsumerState<BasketPage> {
  @override
  void initState() {
    super.initState();
  }

  var basketitems = [];
  var basketItemsId = [];
  getPrd() {
    var baskets = ref.watch(basketsProvider);
    var lis = [];
    baskets.forEach((item) {
      products.forEach((p) {
        if (item.prdId == p['id']) {
          lis.add(p);
          basketItemsId.add(item.prdId);
        }
      });
    });
    basketitems = lis;
  }

  var total;
  totalPrice() {
    double t = 0.0;
    var baskets = ref.watch(basketsProvider);
    baskets.forEach((item) {
      products.forEach((p) {
        if (item.prdId == p['id']) {
          t += double.parse(p['price']) * double.parse(item.total);
        }
        ;
      });
    });
    t = double.parse(t.toStringAsFixed(2));
    return t == 0.0 ? "0" : t.toString();
  }

  setOrder() {
    var len = ref.watch(ordersProvider).length;
    ref.read(ordersProvider.notifier).add(
          Order(
            orderId: len.toString(),
            prdId: basketItemsId,
            total: total,
            date: DateTime.now(),
            orderDetail: 'sipariş alındı',
            stance: "1",
          ),
        );
  }

  var carpage = 0;
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    getPrd();
    total = totalPrice();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5AA9E6),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Sepet',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(children: [
        //confirm basket
        Container(
          height: 60,
          padding:
              const EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
          margin: const EdgeInsets.only(bottom: 7),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            children: [
              Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Container(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size.zero,
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        setOrder();
                        ref.read(basketsProvider.notifier).removeAll();
                      },
                      child: const Text(
                        'Sepeti Onayla',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  )),
              Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    height: 44,
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        total.toString(),
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue),
                      ),
                    ),
                  ))
            ],
          ),
        ),
        //products in the basket
        Container(
          height: (MediaQuery.of(context).size.height / 16) * 11.5,
          child: basketitems.length == 0
              ? buildbasketempty()
              : ListView(
                  children:
                      basketitems.map((prd) => BasketItem(prd: prd)).toList(),
                ),
        )
      ]),
    );
  }

  buildbasketempty() {
    return Center(
      child: Image.asset(
        "assets/images/sepetiniz-bos.png",
        width: 180,
        height: 180,
      ),
    );
  }
}
