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
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF00A8FF),
        surfaceTint: Color(0xff006399),
        onPrimary: Color(0xffffffff),
        primaryContainer: Color(0xff4db3ff),
        onPrimaryContainer: Color(0xff00233a),
        secondary: Color(0xff3b6283),
        onSecondary: Color(0xffffffff),
        secondaryContainer: Color(0xffbdddff),
        onSecondaryContainer: Color(0xff1c4665),
        tertiary: Color(0xff006399),
        onTertiary: Color(0xffffffff),
        tertiaryContainer: Color(0xff4db3ff),
        onTertiaryContainer: Color(0xff00233a),
        error: Color(0xff930a0a),
        onError: Color(0xffffffff),
        errorContainer: Color(0xffc7352a),
        onErrorContainer: Color(0xffffffff),
        surface: Color(0xfffcf8f9),
        onSurface: Color(0xff1c1b1c),
        onSurfaceVariant: Color(0xff3e4852),
        outline: Color(0xff6f7883),
        outlineVariant: Color(0xffbec7d3),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xff313031),
        inversePrimary: Color(0xff95ccff),
        primaryFixed: Color(0xffcde5ff),
        onPrimaryFixed: Color(0xff001d32),
        primaryFixedDim: Color(0xff95ccff),
        onPrimaryFixedVariant: Color(0xff004a75),
        secondaryFixed: Color(0xffcde5ff),
        onSecondaryFixed: Color(0xff001d32),
        secondaryFixedDim: Color(0xffa4caf0),
        onSecondaryFixedVariant: Color(0xff214a6a),
        tertiaryFixed: Color(0xffcde5ff),
        onTertiaryFixed: Color(0xff001d32),
        tertiaryFixedDim: Color(0xff95ccff),
        onTertiaryFixedVariant: Color(0xff004a75),
        surfaceDim: Color(0xffdcd9d9),
        surfaceBright: Color(0xfffcf8f9),
        surfaceContainerLowest: Color(0xffffffff),
        surfaceContainerLow: Color(0xfff6f3f3),
        surfaceContainer: Color(0xfff0eded),
        surfaceContainerHigh: Color(0xffebe7e7),
        surfaceContainerHighest: Color(0xffe5e2e2),
      ),
      
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