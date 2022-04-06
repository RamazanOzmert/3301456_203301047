import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GetList extends StatefulWidget {
  const GetList({Key? key, required this.listeAdi}) : super(key: key);
  final String listeAdi;
  @override
  State<GetList> createState() => _GetListState();
}

class _GetListState extends State<GetList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.red,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.more_vert),
              )),
        ],
      ),
      body: Container(
          /*decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/wall.jpg"),
              fit: BoxFit.cover,
            ),
          ),*/
          child: Column(children: [
        Container(
          color: Colors.white,
          padding:
              const EdgeInsets.only(left: 10, top: 14, right: 8, bottom: 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Icon(
                      Icons.radio_button_unchecked,
                      size: 30,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'sample item',
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ]),
                  Icon(
                    Icons.star,
                    color: Colors.pink,
                  ),
                ],
              ),
              TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.plus_one_rounded,
                        size: 25,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'adım ekle',
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      )
                    ],
                  ))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: Column(
            children: [
              Card(
                child: Container(
                  height: 60,
                  padding: EdgeInsets.only(left: 6, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Icon(
                          Icons.wb_sunny_outlined,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'günüm görünümüne ekle',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  height: 120,
                  padding:
                      EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 12),
                  child: Row(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.add_alert),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      children: [Text('bana anımsat')],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.date_range),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      children: [
                                        Text('son tarih ekle'),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.replay_outlined),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [Text('yineleme ekle')],
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  height: 60,
                  padding: EdgeInsets.only(left: 12, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Icon(Icons.file_present),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'dosya ekle',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ])),
      bottomSheet: BottomAppBar(
        child: Container(
          height: 60,
          padding: EdgeInsets.only(left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('+ Nisan pzt tarihinde oluşturuldu'),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
