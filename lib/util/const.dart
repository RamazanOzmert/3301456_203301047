import 'package:flutter/material.dart';

class Constants {
  static String appName = 'Market App';

  //Colors for theme
  static Color lightgreyText = Color(0xFF8D8B8B);
  static Color lightPrimary = Color(0xFF);
  static Color lightYellow = Color(0xFFFFE45E);
  static Color lightBgGrey = Color(0xFFF9F9F9);
  static Color lightBlue = Color(0xFF7FC8F8);
  static Color lightDarkBlue = Color(0xFF5AA9E6);

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBgGrey,
    fontFamily: 'Roboto-Medium',
    primaryColor: lightPrimary,
    primaryColorLight: lightBlue,
    focusColor: lightgreyText,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightDarkBlue,
      ),
    ),
    cardColor: Colors.white,
    bottomAppBarColor: Colors.white,
    accentColor: lightDarkBlue,
    //cursorColor: lightDarkBlue,
    scaffoldBackgroundColor: lightBgGrey,

    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
      color: lightYellow,
      fontSize: 30.0,
      fontFamily: 'BalooBhai',
      fontWeight: FontWeight.bold,
    )),
  );
}
