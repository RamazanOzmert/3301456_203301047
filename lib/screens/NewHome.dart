import 'package:cepte/screens/Planned.dart';
import 'package:cepte/screens/Sidebar.dart';

import 'package:cepte/screens/profile.dart';

import 'package:cepte/screens/settings.dart';
import 'package:cepte/screens/significant.dart';
import 'package:cepte/screens/tasks.dart';
import 'package:cepte/screens/today.dart';
import 'package:flutter/material.dart';

class MyNewHomePage extends StatefulWidget {
  const MyNewHomePage({Key? key}) : super(key: key);

  @override
  State<MyNewHomePage> createState() => _MyNewHomePageState();
}

class _MyNewHomePageState extends State<MyNewHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text("Cepte List"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.wb_sunny_outlined),
              title: Text('Günüm'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TodayPage()),
                ),
              },
            ),
            ListTile(
              leading: Icon(Icons.star_border),
              title: Text('Önemli'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Significant()),
                ),
              },
            ),
            ListTile(
              leading: Icon(Icons.next_plan_outlined),
              title: Text('planlanan'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlannedPage()),
                ),
              },
            ),
            ListTile(
              leading: Icon(Icons.topic_outlined),
              title: Text('görevler'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TasksPage()),
                ),
              },
            ),
          ],
        ),
      ),
      bottomSheet: BottomAppBar(
        child: Container(
          height: 60,
          padding: EdgeInsets.only(left: 6, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => {
                  //
                },
                child: Row(children: [
                  Icon(
                    Icons.add,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'new List',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Raleway',
                      color: Colors.red,
                    ),
                  ),
                ]),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add_box_outlined,
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
