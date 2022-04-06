import 'package:cepte/screens/getList.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlannedPage extends StatelessWidget {
  PlannedPage({Key? key}) : super(key: key);

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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/wall.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: [
            Container(
              padding:
                  const EdgeInsets.only(left: 10, top: 4, right: 8, bottom: 0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Column(
                  children: [
                    Text(
                      'Planlanan',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    PopupMenuButton(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.pink[300],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            width: 100,
                            height: 35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.date_range_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'Bu hafta',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        itemBuilder: (context) => [
                              PopupMenuItem(
                                child: Text("Süresi geçmiş"),
                                value: 1,
                              ),
                              PopupMenuItem(
                                child: Text("Bugün"),
                                value: 2,
                              ),
                              PopupMenuItem(
                                child: Text("Yarın"),
                                value: 3,
                              ),
                              PopupMenuItem(
                                child: Text("Bu hafta"),
                                value: 4,
                              ),
                              PopupMenuItem(
                                child: Text("Tümü"),
                                value: 4,
                              ),
                            ])
                  ],
                ),
              ]),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  Card(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        maximumSize: Size(1500, 60),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const GetList(listeAdi: "Sample item 2")),
                        );
                      },
                      child: Container(
                        height: 60,
                        padding: EdgeInsets.only(left: 6, right: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Icon(Icons.radio_button_unchecked),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Sample item',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Raleway',
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.wb_sunny_outlined,
                                        size: 14,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        'Günüm',
                                        style: TextStyle(fontSize: 14),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ]),
                            Icon(Icons.star_border),
                          ],
                        ),
                      ),
                      //
                    ),
                  ),
                  Card(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        maximumSize: Size(1500, 60),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const GetList(listeAdi: "Sample item")),
                        );
                      },
                      child: Container(
                        height: 60,
                        padding: EdgeInsets.only(left: 6, right: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Icon(Icons.radio_button_unchecked),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Sample item',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Raleway',
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.wb_sunny_outlined,
                                        size: 14,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        'Günüm',
                                        style: TextStyle(fontSize: 14),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ]),
                            Icon(Icons.star_border),
                          ],
                        ),
                      ),
                      //
                    ),
                  ),
                ],
              ),
            ),
          ])),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
