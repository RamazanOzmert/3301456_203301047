import 'package:cepte/screens/getList.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({Key? key}) : super(key: key);

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  final day = DateTime.now().day.toString();
  final month = DateTime.now().month.toString();
  final year = DateTime.now().year.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  const EdgeInsets.only(left: 10, top: 14, right: 8, bottom: 0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Column(
                  children: [
                    Text(
                      'Today',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    Text(
                      day + "-" + month + "-" + year,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ]),
            ),
            Container(
              margin: EdgeInsets.only(top: 4),
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
                              Text(
                                'Sample item',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Raleway',
                                ),
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
