import 'package:flutter/material.dart';

import 'package:marketapp/util/categories.dart';
import 'package:marketapp/widgets/address_row.dart';
import 'package:marketapp/widgets/category_item.dart';
import 'package:marketapp/widgets/logo_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State createState() => _Home();
}

class _Home extends State<Home> {
  var selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //ekran tıklamsını almak için
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          appBar: LogoBar(),
          body: ListView(children: [
            const AddressRow(),
            buildCategoryWrap(context),
            const SizedBox(
              height: 15,
            )
          ])),
    );
  }

  buildCategoryWrap(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: categories.map((i) => CategoryItem(cat: i)).toList(),
        ),
      ),
    );
  }
}
