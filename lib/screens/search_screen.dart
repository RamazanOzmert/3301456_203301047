import 'package:flutter/material.dart';

import 'package:marketapp/util/products.dart';
import 'package:marketapp/widgets/product%20_item.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);
  @override
  State createState() => _Products();
}

class _Products extends State<Search> {
  List filters = [
    "su",
    "kaşar",
    "sucuk",
    "süt",
    "cips",
    "yumurta",
    "tavuk",
    "dondurma",
    "tereyağ",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5AA9E6),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Arama',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      body: Wrap(runSpacing: 15, children: [
        buildSearchInput(context),
        Column(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 5),
                  child: Text(
                    'Popüler Aramalar',
                    style: TextStyle(
                      color: Theme.of(context).focusColor,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              buildFilterRow(context),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15, bottom: 5),
                child: Text(
                  'Çok Satanlar',
                  style: TextStyle(
                    color: Theme.of(context).focusColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              buildProductsWrap(context),
            ],
          ),
        ]),
      ]),
    );
  }

  buildSearchInput(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            spreadRadius: 1,
            blurStyle: BlurStyle.normal,
            offset: Offset(0, 3))
      ]),
      padding: EdgeInsets.all(15),
      height: 60,
      child: TextFormField(
        cursorHeight: 24,
        decoration: InputDecoration(
            fillColor: Colors.white,
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
            iconColor: Theme.of(context).canvasColor,
            hintText: 'Ürün ara'),
      ),
    );
  }

  buildFilterRow(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            spreadRadius: 1,
            blurStyle: BlurStyle.normal,
            offset: Offset(0, 3))
      ]),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: filters
            .map((e) => Container(
                constraints: BoxConstraints(maxHeight: 30),
                margin: EdgeInsets.all(10),
                child: OutlinedButton(
                  child: Text(e),
                  onPressed: () {},
                )))
            .toList(),
      ),
    );
  }

  buildProductsWrap(BuildContext context) {
    var selected_prd = [];

    products.forEach((prd) {
      /* if (prd['category_name'] == 'Teknoloji') {
        selected_prd.add(prd);
      }*/
      selected_prd.add(prd);
    });

    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 440,
        maxHeight: MediaQuery.of(context).size.height - 310,
      ),
      color: Colors.white,
      child: ListView(scrollDirection: Axis.vertical, children: [
        Container(
          padding: const EdgeInsets.all(10),
          constraints: BoxConstraints(maxWidth: 390),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Wrap(
              //alignment: WrapAlignment.spaceBetween,
              spacing: 8.0,
              runSpacing: 8.0,
              children: selected_prd.map((i) => ProductItem(prd: i)).toList(),
            ),
          ]),
        ),
      ]),
    );
  }
}
