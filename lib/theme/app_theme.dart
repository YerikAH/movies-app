import 'package:flutter/material.dart';
class AppTheme{
  static const String fontFamily = "nunitoSans";
  static const Color black = Color(0xff333333);
  static const Color gray = Color(0xff495057);
  static const Color white = Colors.white;
  static const Color skyBlue = Color(0xff5390d9);
  static const Color blackBlue = Color(0xff1b263b);
  static final ThemeData configTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: black.withOpacity(0.5),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: skyBlue
    ),
    textTheme: const TextTheme(
    headline1: TextStyle(fontFamily: fontFamily, fontSize: 20, fontWeight: FontWeight.bold, color:white ),
    headline2: TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.bold, color:black),
    headline3: TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.bold, color:black),
    headline4: TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.bold, color:black),
    headline5: TextStyle(fontFamily: fontFamily, fontSize: 20, fontWeight: FontWeight.bold, color:black),
    headline6: TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.bold, color:black),
    bodyText1: TextStyle(fontFamily: fontFamily, fontSize: 14, color:gray),
    bodyText2: TextStyle(fontFamily: fontFamily, fontSize: 14, color:gray),
    caption: TextStyle(fontFamily: fontFamily, fontSize: 14, color:black),
    button: TextStyle(fontFamily: fontFamily, fontSize: 14, color:black),
    subtitle1: TextStyle(fontFamily: fontFamily, fontSize: 14, color:black),
    subtitle2: TextStyle(fontFamily: fontFamily, fontSize: 14, color:black),
    overline: TextStyle(fontFamily: fontFamily, fontSize: 14, color:black),
    ),
      
  );
}
