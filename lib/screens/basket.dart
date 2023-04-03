import 'package:flutter/material.dart';

import 'package:marketapp/util/basket.dart';
import 'package:marketapp/widgets/basket_item.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Basket extends StatefulWidget {
  @override
  State createState() => _Basket();
}

var _height = 200.0;

class _Basket extends State<Basket> {
  //var adet = 1;
  List<dynamic> get basketitems => basket;
  //var prd = basketitems.first;

  var carpage = 0;
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    List butonlar = ["önerilenler", "detaylar"];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF5AA9E6),
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'Sepet',
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white,
              //fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
        //PageBar(title: 'Sepet', icon: Icon(Icons.delete_forever)),
        body: Padding(
          padding: EdgeInsets.only(top: 0.0),
          child: Column(children: [
            //sepeti onayla
            Container(
              width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.height / 16) * 1.5,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.grey, width: 1))),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: Container(
                        height: (MediaQuery.of(context).size.height / 16) * 1.5,
                        color: Colors.amber,
                        child: ElevatedButton(
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
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Container(
                        height: (MediaQuery.of(context).size.height / 16) * 1.5,
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
              //color: Colors.white,

              child: basket.length == 0
                  ? buildbasketempty()
                  : ListView(
                      children: basketitems
                          .map((prd) => BasketItem(prd: prd))
                          .toList(),
                    ),
            )
          ]),
        ));
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
