import 'package:flutter/material.dart';

class ThemeConfig {
  static const double _smallFontSize = 14;
  static const double _normalFontSize = 16;
  static const double _largeFontSize = 20;
  static const double _xLargeFontSize = 24;
  static const double _xXLargeFontSize = 30;

  static final ThemeData themDate = ThemeData(
      primarySwatch: Colors.pink,
      accentColor: Colors.amber,
      canvasColor: Color.fromRGBO(255, 254, 222, 1),
      textTheme: TextTheme(
        bodyText2: TextStyle(fontSize: _normalFontSize),
        headline4: TextStyle(
            fontSize: _xLargeFontSize,
            color: Colors.black87,
            fontWeight: FontWeight.bold),
        headline3: TextStyle(fontSize: _largeFontSize),
        headline2: TextStyle(fontSize: _smallFontSize),
        headline5: TextStyle(fontSize: _xXLargeFontSize),
      ));
  static final ThemeData dartTheme = ThemeData(
    primarySwatch: Colors.grey,
  );
}
