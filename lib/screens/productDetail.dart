import 'package:flutter/material.dart';

import 'package:marketapp/util/products.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:marketapp/widgets/product%20_item.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key, required this.prd}) : super(key: key);
  final Map prd;

  @override
  State createState() => _ProductDetail();
}

class _ProductDetail extends State<ProductDetail> {
  var carpage = 0;
  CarouselController carouselController = CarouselController();
  var ico = true;

  @override
  Widget build(BuildContext context) {
    var _height = 200.0;

    List butonlar = ["önerilenler", "detaylar"];
    return Scaffold(
        appBar: ico ? _defaultBar() : _editingBar(),
        body: Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Column(children: [
            //product
            Container(
              height: MediaQuery.of(context).size.height / 2.7,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Column(
                  children: [
                    Container(
                      child: Image.asset(
                        widget.prd['img'], //list isn't null
                        height: _height - 30,
                        width: _height - 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: _height / 3,
                      padding: EdgeInsets.only(top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.prd['price'],
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.prd['name'],
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                          ),
                          Text(
                            widget.prd['property'],
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            //Suggestion-Detail slider
            Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 36,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: carpage == 0
                                ? BorderSide(
                                    width: 3,
                                    color: Colors.yellow,
                                    style: BorderStyle.solid)
                                : BorderSide.none,
                          ),
                        ),
                        child: TextButton(
                            onPressed: () {
                              carouselController.animateToPage(0,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.fastOutSlowIn);

                              setState(() {
                                carpage = 0;
                              });
                            },
                            child: Text('önerilenler')),
                      ),
                      Container(
                        height: 36,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: carpage == 1
                                ? BorderSide(
                                    width: 3,
                                    color: Colors.yellow,
                                    style: BorderStyle.solid)
                                : BorderSide.none,
                          ),
                        ),
                        child: TextButton(
                            onPressed: () {
                              carouselController.animateToPage(1,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.fastOutSlowIn);

                              setState(() {
                                carpage = 1;
                              });
                            },
                            child: Text('detaylar')),
                      ),
                    ],
                  ),
                ),
                //carousel Slider
                Container(
                  padding: EdgeInsets.only(top: 5, left: 15, right: 15),
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 237, 237, 237)),
                  child: CarouselSlider(
                    carouselController: carouselController,
                    items: [
                      // birinci slayt
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: buildSuggestionWrap(),
                      ),
                      //ikinci slayt
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ListView.builder(
                          itemCount: widget.prd['details'].length,
                          itemBuilder: (conext, index) => Container(
                              padding: EdgeInsets.only(
                                bottom: 5,
                              ),
                              child: Text(
                                '- ' + widget.prd['details'][index].toString(),
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 55, 54, 54)),
                              )),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height / 2.8,
                      enlargeCenterPage: false,
                      autoPlay: false,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: false,
                      autoPlayAnimationDuration: Duration(milliseconds: 500),
                      viewportFraction: 1,
                      initialPage: 2,
                      onPageChanged: (index, reason) {
                        setState(() {
                          carpage = index;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            //button: 'Sepete Ekle'
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.grey, width: 1))),
              child: ElevatedButton(
                onPressed: () {
                  //add basket func
                },
                child: Text(
                  'Sepete Ekle',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          ]),
        ));
  }

  _defaultBar() {
    return AppBar(
      title: Text(
        'ürün detay',
        style: TextStyle(
          fontFamily: 'Montserrat',
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.star_border),
            onPressed: () {
              //add favorite func
              setState(() {
                ico = false;
              });
            })
      ],
      backgroundColor: Color(0xFF5AA9E6),
    );
  }

  _editingBar() {
    return AppBar(
      title: Text(
        'ürün detay',
        style: TextStyle(
          fontFamily: 'Montserrat',
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.star),
            onPressed: () {
              //add favorite func
              setState(() {
                ico = true;
              });
            })
      ],
      backgroundColor: Color(0xFF5AA9E6),
    );
  }

  buildSuggestionWrap() {
    var suggestions = [];
    var prd_cat = widget.prd['category_name'];
    var prd_price = double.parse(widget.prd['price']);
    var about_min_price = prd_price - (prd_price * (25 / 100)); // %25 altı
    var about_max_price = prd_price + (prd_price * (25 / 100)); // %25 üstü

    products.forEach((p) {
      if (p != widget.prd) {
        if (p['category_name'] == prd_cat) {
          var price = double.parse(p['price']);
          if (price > about_min_price && price < about_max_price) {
            suggestions.add(p);
          }
        }
      }
    });

    return Container(
        child: ListView(scrollDirection: Axis.vertical, children: [
      Wrap(
        children: suggestions.map((i) => ProductItem(prd: i)).toList(),
      )
    ]));
  }
}
