import 'package:flutter/material.dart';

ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: const Color(0xFF00A8FF), // Set the background color
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // Set the border radius
    ),
  ),
);

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: const Color(0xFF00A8FF),
      scaffoldBackgroundColor: const Color(0xFF33ABE9),
      fontFamily: 'Roboto',
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFF00A8FF),
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: elevatedButtonThemeData,
    );
  }
}