import 'package:flutter/material.dart';
class AppTheme{
  static final ThemeData configTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      elevation: 0
    ),
      
    textTheme: const TextTheme(
      headline1: TextStyle(fontFamily: 'NunitoSans', fontSize: 72, fontWeight: FontWeight.bold),
      headline2: TextStyle(fontFamily: 'NunitoSans', fontSize: 36, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(fontFamily: 'NunitoSans', fontSize: 14),
      bodyText2: TextStyle(fontFamily: 'NunitoSans', fontSize: 14),
      caption: TextStyle(fontFamily: 'NunitoSans', fontSize: 14),
      button: TextStyle(fontFamily: 'NunitoSans', fontSize: 14),
      subtitle1: TextStyle(fontFamily: 'NunitoSans', fontSize: 14,color: Colors.black),
      subtitle2: TextStyle(fontFamily: 'NunitoSans', fontSize: 14),
      overline: TextStyle(fontFamily: 'NunitoSans', fontSize: 14),
    ),
      
  );
}