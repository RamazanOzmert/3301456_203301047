import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:marketapp/globalStates/basket.dart';
import 'package:marketapp/globalStates/favorites.dart';

import 'package:marketapp/util/products.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:marketapp/widgets/product%20_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetail extends ConsumerStatefulWidget {
  const ProductDetail({Key? key, required this.prd}) : super(key: key);
  final Map prd;

  @override
  ConsumerState createState() => _ProductDetail();
}

class _ProductDetail extends ConsumerState<ProductDetail> {
  @override
  void initState() {
    super.initState();
  }

  var isFav;
  getFav() {
    var favPrd = ref.watch(favoriteProvider);
    isFav = favPrd.any((element) => element.prdId == widget.prd['id']);
  }

  updateFavorite() {
    ref.read(favoriteProvider.notifier).update(
          Favorite(prdId: widget.prd['id']),
        );
    getFav();
  }

  var carpage = 0;
  CarouselController carouselController = CarouselController();
  var ico = true;

  @override
  Widget build(BuildContext context) {
    getFav();
    var _height = 250.0;
    var maxhe = MainAxisSize.max;
    List butonlar = ["önerilenler", "detaylar"];
    return Scaffold(
      appBar: isFav ? _editingBar() : _defaultBar(),
      body: Container(
        padding: EdgeInsets.only(top: 16.0),
        height: MediaQuery.of(context).size.height,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //product
              Container(
                height: MediaQuery.of(context).size.height / 2.7,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Column(children: [
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: _height,
                        maxWidth: _height,
                      ),
                      child: GestureDetector(
                        onDoubleTap: () {
                          updateFavorite();
                        },
                        child: Image.asset(
                          widget.prd['img'], //list isn't null
                          // height: _height - 30,
                          // width: _height - 30,
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width / 2,
                          fit: BoxFit.cover,
                        ),
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
                                  color: Theme.of(context).canvasColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.prd['name'],
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.black),
                            ),
                            Text(
                              widget.prd['property'],
                              style:
                                  TextStyle(fontSize: 12.0, color: Colors.grey),
                            ),
                          ]),
                    )
                  ]),
                ),
              ),
              //Suggestion-Detail slider
              Column(children: [
                //slider buttons
                Container(
                  child: Row(children: [
                    Container(
                      height: 40,
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
                      height: 40,
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
                  ]),
                ),
                //carousel Slider

                Container(
                  constraints: BoxConstraints(),
                  padding: EdgeInsets.only(top: 5, left: 15, right: 15),
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 237, 237, 237)),
                  child: CarouselSlider(
                    carouselController: carouselController,
                    items: [
                      //suggestion slayt
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: buildSuggestionWrap(),
                      ),
                      //details slayt
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
              ]),
              //
              //button: 'Sepete Ekle'
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  constraints: BoxConstraints(
                    maxHeight: 70,
                  ),
                  height: 70,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey, width: 1))),
                  child: ElevatedButton(
                    onPressed: () => ref
                        .read(basketsProvider.notifier)
                        .add(Basket(prdId: widget.prd['id'], total: "1")),
                    child: Text(
                      'Sepete Ekle',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
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
            icon: Icon(
              Icons.star_border,
              color: Colors.amber,
            ),
            onPressed: () {
              updateFavorite();
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
            icon: Icon(Icons.star, color: Colors.amber),
            onPressed: () {
              //add favorite func
              updateFavorite();
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
