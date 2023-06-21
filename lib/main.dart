import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketapp/screens/first_screen.dart';
import 'package:marketapp/util/const.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
/*
void main() async {
  runApp(ProviderScope(child: MyApp()));
}*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: Constants.lightTheme,
      home: const FirstPage(),
    );
  }
}


//CollaectApi
//https://collectapi.com/tr/api/shopping/e-ticaret-api