import 'package:flutter/material.dart';

ThemeData newTheme() => ThemeData(
  fontFamily: 'Georgia',
splashColor: Colors.deepOrange,
colorScheme: ColorScheme.fromSwatch(
  brightness: Brightness.light,
    primarySwatch: Colors.cyan,
).copyWith(
  secondary: Colors.orangeAccent,
),
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black26,),
    headline2: TextStyle(fontSize: 30, color: Colors.grey, fontWeight: FontWeight.w100),
    bodyText2: TextStyle(fontSize: 16, fontFamily: 'Hind', color: Colors.red, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(fontSize: 16, fontFamily: 'Hind', color: Colors.redAccent, ),
    subtitle2: TextStyle(fontSize: 18, color: Colors.yellow),

    )
);
