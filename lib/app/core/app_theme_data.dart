import 'package:flutter/material.dart';

class AppThemeData {
  final BorderRadius borderRadius = BorderRadius.circular(8);

  final Color colorYellow = Color(0xffffff00);
  final Color colorPrimary = Color(0xffabcdef);

  static ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.grey[900],
    accentColor: Colors.orange,
    primarySwatch: Colors.orange,
  );
}
