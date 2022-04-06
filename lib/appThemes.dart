
import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static const int lightBlue = 0;
  static const int lightRed = 1;
  static const int lightPink = 2;
  static const int lightGreen = 3;
  static const int darkBlue = 4;
  static const int darkRed = 5;
  static const int darkPink = 6;
  static const int darkGreen = 7;
}

Color calculateTextColor(Color background) {
  return background.computeLuminance() >= 0.5 ? Colors.black : Colors.white;
}

const appBarTheme =  AppBarTheme(
  backgroundColor: Colors.white,
  titleTextStyle: TextStyle(color: Colors.black, fontSize: 20.0),
  elevation: 5.0,
);

const inputDecorationTheme = InputDecorationTheme(
  isDense: true,// this will remove the default content padding
);

final themeCollection = ThemeCollection(
  themes: {
    AppThemes.lightBlue: ThemeData(primarySwatch: Colors.blue, appBarTheme: appBarTheme, inputDecorationTheme: inputDecorationTheme),
    AppThemes.lightRed: ThemeData(primarySwatch: Colors.red, appBarTheme: appBarTheme, inputDecorationTheme: inputDecorationTheme),
    AppThemes.lightPink: ThemeData(primarySwatch: Colors.pink, appBarTheme: appBarTheme, inputDecorationTheme: inputDecorationTheme),
    AppThemes.lightGreen: ThemeData(primarySwatch: Colors.green, appBarTheme: appBarTheme, inputDecorationTheme: inputDecorationTheme),
    AppThemes.darkBlue: ThemeData.dark().copyWith(primaryColor: Colors.blue, inputDecorationTheme: inputDecorationTheme),
    AppThemes.darkRed: ThemeData.dark().copyWith(primaryColor: Colors.red, inputDecorationTheme: inputDecorationTheme),
    AppThemes.darkPink: ThemeData.dark().copyWith(primaryColor: Colors.pink, inputDecorationTheme: inputDecorationTheme),
    AppThemes.darkGreen: ThemeData.dark().copyWith(primaryColor: Colors.green, inputDecorationTheme: inputDecorationTheme),
  },
  fallbackTheme: ThemeData.light().copyWith(inputDecorationTheme: inputDecorationTheme),
);

