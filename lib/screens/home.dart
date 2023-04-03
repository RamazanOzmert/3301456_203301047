import 'package:flutter/material.dart';

import 'package:marketapp/util/address.dart';
import 'package:marketapp/util/categories.dart';
import 'package:marketapp/widgets/categor_item.dart';
import 'package:marketapp/widgets/logoBar.dart';

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
            bulidAddressRow(
              context,
              selected == null
                  ? 'Lütfen adresinizi seçiniz.'
                  : selected.toString(),
            ),
            buildCategoryWrap(context),
            SizedBox(
              height: 15,
            )
          ])),
    );
  }

  bulidAddressRow(BuildContext context, String Address) {
    return Container(
      color: Color(0xFFFFE45E),
      constraints: BoxConstraints(
        minHeight: 48.0,
        maxHeight: 50.0,
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: TextButton(
                style: TextButton.styleFrom(
                  fixedSize: Size(100, 50),
                  backgroundColor: Colors.white,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$Address",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.expand_more,
                        color: Colors.blue,
                      ),
                    ]),
                onPressed: () => buildModalBottomSheet(context),
              ),
            ),
            //
            Expanded(
              flex: 1,
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 48.0,
                  maxHeight: 50.0,
                ),
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Minimum',
                            style: TextStyle(
                              fontSize: 12.0,
                            )),
                        Text('75 TL',
                            style: TextStyle(
                              fontSize: 12.0,
                            )),
                      ],
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Gönderim',
                            style: TextStyle(
                              fontSize: 11.0,
                            )),
                        Text('Ücreti',
                            style: TextStyle(
                              fontSize: 11.0,
                            )),
                        Text('15 TL',
                            style: TextStyle(
                              fontSize: 12.0,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }

  buildModalBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          padding: EdgeInsets.all(15),
          child: Column(children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Container(
                    padding: EdgeInsets.all(25.0),
                    height: 5.0,
                    width: 50.0,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Container(
                height: 50.0,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(width: 1.5, color: Colors.grey),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Teslimat adresi seçin.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    TextButton.icon(
                      icon: Icon(
                        Icons.location_on_outlined,
                        color: Theme.of(context).accentColor,
                        size: 20,
                      ),
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      label: Text(
                        'Adreslerim',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 12,
              fit: FlexFit.tight,
              child: Container(
                constraints: BoxConstraints(minHeight: 100.0, maxHeight: 230.0),
                color: Theme.of(context).backgroundColor,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: address
                      .map(
                        (e) => ListTile(
                          leading: Radio(
                            value: e['address'].toString(),
                            groupValue: selected,
                            onChanged: (value) {
                              setState(() {
                                selected = value.toString();
                              });
                            },
                          ),
                          title: Text(e['name'].toString()),
                          subtitle: Text(e['address'].toString()),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Container(
                height: 60.0,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        icon: Icon(
                          Icons.add,
                          color: Theme.of(context).accentColor,
                        ),
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {},
                        label: Text(
                          'adres ekle',
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ]),
              ),
            )
          ]),
        );
      },
    );
  }

  buildCategoryWrap(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: categories.map((i) => CategoryItem(cat: i)).toList(),
        ),
      ),
    );
  }
}
