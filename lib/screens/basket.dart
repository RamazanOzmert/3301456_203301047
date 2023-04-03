import 'package:flutter/material.dart';

import 'package:marketapp/util/basket.dart';
import 'package:marketapp/widgets/basket_item.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Basket extends StatefulWidget {
  const Basket({Key? key}) : super(key: key);
  @override
  State createState() => _Basket();
}

class _Basket extends State<Basket> {
  List<dynamic> get basketitems => basket;
  var carpage = 0;
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
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
        //sepeti onayla
        Container(
          height: 60,
          padding:
              const EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
          margin: EdgeInsets.only(bottom: 7),
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
                        //add basket func
                      },
                      child: Text(
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
                        '254.99 TL',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue),
                      ),
                    ),
                  ))
            ],
          ),
        ),

        // sepetteki ürünler
        Container(
          height: (MediaQuery.of(context).size.height / 16) * 11.5,
          child: basket.length == 0
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
