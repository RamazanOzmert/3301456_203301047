import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // This widget is the root of your application.
  final String email = "palmeiro.leonardo@gmail.com";
  final String password = "**********";
  final String name = "Leonardo";
  final String lastName = "Palmeiro";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: const Text('Profile'),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.deepOrange.shade300],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.5, 0.9],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white70,
                      minRadius: 60.0,
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(
                            'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    'Leonardo Palmeiro',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.app_registration_rounded),
                    iconSize: 25,
                    color: Colors.brown,
                    tooltip: 'change your name',
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 220,
                            color: Color.fromARGB(183, 241, 87, 40),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              margin: EdgeInsets.all(40),
                              child: Column(
                                children: [
                                  TextField(
                                    cursorColor: Colors.white,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'name',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Color.fromARGB(
                                                255, 252, 153, 124),
                                          ),
                                          child: const Text(
                                            'Save',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            //save the Email
                                          },
                                        ),
                                      ]),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ]),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Text(email),
                      ElevatedButton(
                        child: Icon(Icons.app_registration_rounded),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrange.shade300,
                        ),
                        onPressed: () {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 220,
                                color: Color.fromARGB(183, 241, 87, 40),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: EdgeInsets.all(40),
                                  child: Column(
                                    children: [
                                      TextField(
                                        cursorColor: Colors.white,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Email',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: Color.fromARGB(
                                                    255, 252, 153, 124),
                                              ),
                                              child: const Text(
                                                'Save',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                //save the Email
                                              },
                                            ),
                                          ]),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Password',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Text(password),
                      ElevatedButton(
                        child: Icon(Icons.app_registration_rounded),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrange.shade300,
                        ),
                        onPressed: () {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 220,
                                color: Color.fromARGB(183, 241, 87, 40),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: EdgeInsets.all(40),
                                  child: Column(
                                    children: [
                                      TextField(
                                        cursorColor: Colors.white,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Password',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: Color.fromARGB(
                                                    255, 252, 153, 124),
                                              ),
                                              child: const Text(
                                                'Save',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                //save the Email
                                              },
                                            ),
                                          ]),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
                Divider(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

/// Flutter code sample for showModalBottomSheet

// This example demonstrates how to use `showModalBottomSheet` to display a
// bottom sheet that obscures the content behind it when a user taps a button.
// It also demonstrates how to close the bottom sheet using the [Navigator]
// when a user taps on a button inside the bottom sheet.
