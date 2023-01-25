import 'package:flutter/material.dart';
class AppTheme{
  static const String fontFamily = "nunitoSans";
  static const Color textColor = Colors.black;
  static const Color white = Colors.white;
  static final ThemeData configTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      elevation: 0
    ),
      
    textTheme: const TextTheme(
    headline1: TextStyle(fontFamily: fontFamily, fontSize: 20, fontWeight: FontWeight.bold, color:white ),
    headline2: TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
    headline3: TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
    headline4: TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
    headline5: TextStyle(fontFamily: fontFamily, fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
    headline6: TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
    bodyText1: TextStyle(fontFamily: fontFamily, fontSize: 14, color: textColor),
    bodyText2: TextStyle(fontFamily: fontFamily, fontSize: 14, color: textColor),
    caption: TextStyle(fontFamily: fontFamily, fontSize: 14, color: textColor),
    button: TextStyle(fontFamily: fontFamily, fontSize: 14, color: textColor),
    subtitle1: TextStyle(fontFamily: fontFamily, fontSize: 14, color: textColor),
    subtitle2: TextStyle(fontFamily: fontFamily, fontSize: 14, color: textColor),
    overline: TextStyle(fontFamily: fontFamily, fontSize: 14, color: textColor),
    ),
      
  );
}