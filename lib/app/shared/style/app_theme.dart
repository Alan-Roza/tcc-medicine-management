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
        surfaceTint: Color(4278215577),
        onPrimary: Color(4294967295),
        primaryContainer: Color(4283282431),
        onPrimaryContainer: Color(4278199098),
        secondary: Color(4282081923),
        onSecondary: Color(4294967295),
        secondaryContainer: Color(4290633215),
        onSecondaryContainer: Color(4280043109),
        tertiary: Color(4278215577),
        onTertiary: Color(4294967295),
        tertiaryContainer: Color(4283282431),
        onTertiaryContainer: Color(4278199098),
        error: Color(4287826442),
        onError: Color(4294967295),
        errorContainer: Color(4291245354),
        onErrorContainer: Color(4294967295),
        surface: Color(4294768889),
        onSurface: Color(4280032028),
        onSurfaceVariant: Color(4282271826),
        outline: Color(4285495427),
        outlineVariant: Color(4290693075),
        shadow: Color(4278190080),
        scrim: Color(4278190080),
        inverseSurface: Color(4281413681),
        inversePrimary: Color(4288007423),
        primaryFixed: Color(4291683839),
        onPrimaryFixed: Color(4278197554),
        primaryFixedDim: Color(4288007423),
        onPrimaryFixedVariant: Color(4278209141),
        secondaryFixed: Color(4291683839),
        onSecondaryFixed: Color(4278197554),
        secondaryFixedDim: Color(4288989936),
        onSecondaryFixedVariant: Color(4280371818),
        tertiaryFixed: Color(4291683839),
        onTertiaryFixed: Color(4278197554),
        tertiaryFixedDim: Color(4288007423),
        onTertiaryFixedVariant: Color(4278209141),
        surfaceDim: Color(4292663769),
        surfaceBright: Color(4294768889),
        surfaceContainerLowest: Color(4294967295),
        surfaceContainerLow: Color(4294374387),
        surfaceContainer: Color(4293979629),
        surfaceContainerHigh: Color(4293650407),
        surfaceContainerHighest: Color(4293255906),
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