import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static final elevatedButtonThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFF00A8FF), // Set the background color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // Set the border radius
      ),
    ),
  );

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF00A8FF),
      surfaceTint: Color(0xff006399),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff4db3ff),
      onPrimaryContainer: Color(0xff00233a),
      secondary: Color(0xFF00A8FF),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4db3ff),
      onSecondaryContainer: Color(0xff00233a),
      tertiary: Color(0xFF00A8FF),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff4db3ff),
      onTertiaryContainer: Color(0xff00233a),
      error: Color(0xff930a0a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffc7352a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xFFF5F4F6),
      onSurface: Color(0xff171c21),
      onSurfaceVariant: Color(0xff3e4852),
      outline: Color(0xff6f7883),
      outlineVariant: Color(0xffbec7d3),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3137),
      inversePrimary: Color(0xff95ccff),
      primaryFixed: Color(0xffcde5ff),
      onPrimaryFixed: Color(0xff001d32),
      primaryFixedDim: Color(0xff95ccff),
      onPrimaryFixedVariant: Color(0xff004a75),
      secondaryFixed: Color(0xffcde5ff),
      onSecondaryFixed: Color(0xff001d32),
      secondaryFixedDim: Color(0xff95ccff),
      onSecondaryFixedVariant: Color(0xff004a75),
      tertiaryFixed: Color(0xffcde5ff),
      onTertiaryFixed: Color(0xff001d32),
      tertiaryFixedDim: Color(0xff95ccff),
      onTertiaryFixedVariant: Color(0xff004a75),
      surfaceDim: Color(0xffd6dae2),
      surfaceBright: Color(0xfff7f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f4fb),
      surfaceContainer: Color(0xffeaeef6),
      surfaceContainerHigh: Color(0xffe4e8f0),
      surfaceContainerHighest: Color(0xffdee3ea),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00466e),
      surfaceTint: Color(0xff006399),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff007abb),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff00466e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff007abb),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff00466e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff007abb),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8b0105),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffc7352a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff7f9ff),
      onSurface: Color(0xff171c21),
      onSurfaceVariant: Color(0xff3a444e),
      outline: Color(0xff57606a),
      outlineVariant: Color(0xff727c87),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3137),
      inversePrimary: Color(0xff95ccff),
      primaryFixed: Color(0xff007abb),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff006195),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff007abb),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff006195),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff007abb),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff006195),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd6dae2),
      surfaceBright: Color(0xfff7f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f4fb),
      surfaceContainer: Color(0xffeaeef6),
      surfaceContainerHigh: Color(0xffe4e8f0),
      surfaceContainerHighest: Color(0xffdee3ea),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00243c),
      surfaceTint: Color(0xff006399),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff00466e),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff00243c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff00466e),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff00243c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff00466e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0001),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8b0105),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff7f9ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff1c252e),
      outline: Color(0xff3a444e),
      outlineVariant: Color(0xff3a444e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3137),
      inversePrimary: Color(0xffdfeeff),
      primaryFixed: Color(0xff00466e),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff002f4c),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff00466e),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff002f4c),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff00466e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff002f4c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd6dae2),
      surfaceBright: Color(0xfff7f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f4fb),
      surfaceContainer: Color(0xffeaeef6),
      surfaceContainerHigh: Color(0xffe4e8f0),
      surfaceContainerHighest: Color(0xffdee3ea),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff95ccff),
      surfaceTint: Color(0xff95ccff),
      onPrimary: Color(0xff003352),
      primaryContainer: Color(0xff00a0f2),
      onPrimaryContainer: Color(0xff00060e),
      secondary: Color(0xff95ccff),
      onSecondary: Color(0xff003352),
      secondaryContainer: Color(0xff00a0f2),
      onSecondaryContainer: Color(0xff00060e),
      tertiary: Color(0xff95ccff),
      onTertiary: Color(0xff003352),
      tertiaryContainer: Color(0xff00a0f2),
      onTertiaryContainer: Color(0xff00060e),
      error: Color(0xffffb4aa),
      onError: Color(0xff690003),
      errorContainer: Color(0xffa61c16),
      onErrorContainer: Color(0xfffff6f5),
      surface: Color(0xff0f1419),
      onSurface: Color(0xffdee3ea),
      onSurfaceVariant: Color(0xffbec7d3),
      outline: Color(0xff88929d),
      outlineVariant: Color(0xff3e4852),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3ea),
      inversePrimary: Color(0xff006399),
      primaryFixed: Color(0xffcde5ff),
      onPrimaryFixed: Color(0xff001d32),
      primaryFixedDim: Color(0xff95ccff),
      onPrimaryFixedVariant: Color(0xff004a75),
      secondaryFixed: Color(0xffcde5ff),
      onSecondaryFixed: Color(0xff001d32),
      secondaryFixedDim: Color(0xff95ccff),
      onSecondaryFixedVariant: Color(0xff004a75),
      tertiaryFixed: Color(0xffcde5ff),
      onTertiaryFixed: Color(0xff001d32),
      tertiaryFixedDim: Color(0xff95ccff),
      onTertiaryFixedVariant: Color(0xff004a75),
      surfaceDim: Color(0xff0f1419),
      surfaceBright: Color(0xff353a3f),
      surfaceContainerLowest: Color(0xff0a0f14),
      surfaceContainerLow: Color(0xff171c21),
      surfaceContainer: Color(0xff1b2025),
      surfaceContainerHigh: Color(0xff252a30),
      surfaceContainerHighest: Color(0xff30353b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff9ed0ff),
      surfaceTint: Color(0xff95ccff),
      onPrimary: Color(0xff00182a),
      primaryContainer: Color(0xff00a0f2),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff9ed0ff),
      onSecondary: Color(0xff00182a),
      secondaryContainer: Color(0xff00a0f2),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff9ed0ff),
      onTertiary: Color(0xff00182a),
      tertiaryContainer: Color(0xff00a0f2),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab0),
      onError: Color(0xff370001),
      errorContainer: Color(0xfffa5a4a),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0f1419),
      onSurface: Color(0xfff9faff),
      onSurfaceVariant: Color(0xffc2ccd8),
      outline: Color(0xff9aa4af),
      outlineVariant: Color(0xff7b848f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3ea),
      inversePrimary: Color(0xff004c76),
      primaryFixed: Color(0xffcde5ff),
      onPrimaryFixed: Color(0xff001222),
      primaryFixedDim: Color(0xff95ccff),
      onPrimaryFixedVariant: Color(0xff00395b),
      secondaryFixed: Color(0xffcde5ff),
      onSecondaryFixed: Color(0xff001222),
      secondaryFixedDim: Color(0xff95ccff),
      onSecondaryFixedVariant: Color(0xff00395b),
      tertiaryFixed: Color(0xffcde5ff),
      onTertiaryFixed: Color(0xff001222),
      tertiaryFixedDim: Color(0xff95ccff),
      onTertiaryFixedVariant: Color(0xff00395b),
      surfaceDim: Color(0xff0f1419),
      surfaceBright: Color(0xff353a3f),
      surfaceContainerLowest: Color(0xff0a0f14),
      surfaceContainerLow: Color(0xff171c21),
      surfaceContainer: Color(0xff1b2025),
      surfaceContainerHigh: Color(0xff252a30),
      surfaceContainerHighest: Color(0xff30353b),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff9faff),
      surfaceTint: Color(0xff95ccff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff9ed0ff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfff9faff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff9ed0ff),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff9faff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff9ed0ff),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f8),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab0),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0f1419),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfff9faff),
      outline: Color(0xffc2ccd8),
      outlineVariant: Color(0xffc2ccd8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3ea),
      inversePrimary: Color(0xff002c48),
      primaryFixed: Color(0xffd5e9ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff9ed0ff),
      onPrimaryFixedVariant: Color(0xff00182a),
      secondaryFixed: Color(0xffd5e9ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff9ed0ff),
      onSecondaryFixedVariant: Color(0xff00182a),
      tertiaryFixed: Color(0xffd5e9ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff9ed0ff),
      onTertiaryFixedVariant: Color(0xff00182a),
      surfaceDim: Color(0xff0f1419),
      surfaceBright: Color(0xff353a3f),
      surfaceContainerLowest: Color(0xff0a0f14),
      surfaceContainerLow: Color(0xff171c21),
      surfaceContainer: Color(0xff1b2025),
      surfaceContainerHigh: Color(0xff252a30),
      surfaceContainerHighest: Color(0xff30353b),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      fontFamily: 'Roboto',
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
    primaryColor: const Color(0xFF00A8FF),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF00A8FF),
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: elevatedButtonThemeData,
  );

  /// Contrast Color
  static const contrastColor = ExtendedColor(
    seed: Color(0xffff5334),
    value: Color(0xffff5334),
    light: ColorFamily(
      color: Color(0xffb82004),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffff6d51),
      onColorContainer: Color(0xff210100),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xffb82004),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffff6d51),
      onColorContainer: Color(0xff210100),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xffb82004),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffff6d51),
      onColorContainer: Color(0xff210100),
    ),
    dark: ColorFamily(
      color: Color(0xffffb4a5),
      onColor: Color(0xff650b00),
      colorContainer: Color(0xffd9381c),
      onColorContainer: Color(0xffffffff),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xffffb4a5),
      onColor: Color(0xff650b00),
      colorContainer: Color(0xffd9381c),
      onColorContainer: Color(0xffffffff),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xffffb4a5),
      onColor: Color(0xff650b00),
      colorContainer: Color(0xffd9381c),
      onColorContainer: Color(0xffffffff),
    ),
  );


  List<ExtendedColor> get extendedColors => [
    contrastColor,
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
