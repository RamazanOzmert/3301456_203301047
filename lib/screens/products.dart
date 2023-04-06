import 'package:flutter/material.dart';

import 'package:marketapp/util/products.dart';
import 'package:marketapp/widgets/prodact%20_item.dart';

class Products extends StatefulWidget {
  const Products({Key? key, required this.category}) : super(key: key);
  final String category;
  @override
  State createState() => _Products();
}

List filters = [
  "yeni ürünler",
  "yeni listelenenler",
  "indirimliler",
  "en çok yorumlananlar"
];

class _Products extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ürünler',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.shopping_basket),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
        backgroundColor: Color(0xFF5AA9E6),
      ),
      body: Column(mainAxisSize: MainAxisSize.max, children: [
        buildFilterRow(context),
        buildProductsWrap(context),
      ]),
    );
  }

  buildFilterRow(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 5, blurStyle: BlurStyle.outer, color: Colors.black)
      ]),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: filters
            .map((e) => TextButton(
                  child: Text(e),
                  onPressed: () {},
                ))
            .toList(),
      ),
    );
  }

  buildProductsWrap(BuildContext context) {
    var selected_prd = [];

    products.forEach((prd) {
      if (prd['category_name'] == widget.category) {
        selected_prd.add(prd);
      }
    });

    return Container(
        height: MediaQuery.of(context).size.height - 145,
        child: Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(left: 25),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 16.0,
                  runSpacing: 8.0,
                  children:
                      selected_prd.map((i) => ProductItem(prd: i)).toList(),
                ),
              ),
            ],
          ),
        ));
  }
}
