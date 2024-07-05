import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static final elevatedButtonThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFF00A8FF), // Set the background color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Set the border radius
      ),
    ),
  );

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278215577),
      surfaceTint: Color(4278215577),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283282431),
      onPrimaryContainer: Color(4278199098),
      secondary: Color(4278215577),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4283282431),
      onSecondaryContainer: Color(4278199098),
      tertiary: Color(4278215577),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283282431),
      onTertiaryContainer: Color(4278199098),
      error: Color(4287826442),
      onError: Color(4294967295),
      errorContainer: Color(4291245354),
      onErrorContainer: Color(4294967295),
      surface: Color(0xFFF5F4F6),
      onSurface: Color(4279704609),
      onSurfaceVariant: Color(4282271826),
      outline: Color(4285495427),
      outlineVariant: Color(4290693075),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086263),
      inversePrimary: Color(4288007423),
      primaryFixed: Color(4291683839),
      onPrimaryFixed: Color(4278197554),
      primaryFixedDim: Color(4288007423),
      onPrimaryFixedVariant: Color(4278209141),
      secondaryFixed: Color(4291683839),
      onSecondaryFixed: Color(4278197554),
      secondaryFixedDim: Color(4288007423),
      onSecondaryFixedVariant: Color(4278209141),
      tertiaryFixed: Color(4291683839),
      onTertiaryFixed: Color(4278197554),
      tertiaryFixedDim: Color(4288007423),
      onTertiaryFixedVariant: Color(4278209141),
      surfaceDim: Color(4292270818),
      surfaceBright: Color(4294441471),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981435),
      surfaceContainer: Color(4293586678),
      surfaceContainerHigh: Color(4293191920),
      surfaceContainerHighest: Color(4292797418),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278208110),
      surfaceTint: Color(4278215577),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278221499),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278208110),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4278221499),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278208110),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278221499),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287299845),
      onError: Color(4294967295),
      errorContainer: Color(4291245354),
      onErrorContainer: Color(4294967295),
      surface: Color(4294441471),
      onSurface: Color(4279704609),
      onSurfaceVariant: Color(4282008654),
      outline: Color(4283916394),
      outlineVariant: Color(4285693063),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086263),
      inversePrimary: Color(4288007423),
      primaryFixed: Color(4278221499),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278215061),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4278221499),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278215061),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4278221499),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278215061),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292270818),
      surfaceBright: Color(4294441471),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981435),
      surfaceContainer: Color(4293586678),
      surfaceContainerHigh: Color(4293191920),
      surfaceContainerHighest: Color(4292797418),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278199356),
      surfaceTint: Color(4278215577),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278208110),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278199356),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4278208110),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278199356),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278208110),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301889),
      onError: Color(4294967295),
      errorContainer: Color(4287299845),
      onErrorContainer: Color(4294967295),
      surface: Color(4294441471),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280034606),
      outline: Color(4282008654),
      outlineVariant: Color(4282008654),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086263),
      inversePrimary: Color(4292865791),
      primaryFixed: Color(4278208110),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278202188),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4278208110),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278202188),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4278208110),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278202188),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292270818),
      surfaceBright: Color(4294441471),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981435),
      surfaceContainer: Color(4293586678),
      surfaceContainerHigh: Color(4293191920),
      surfaceContainerHighest: Color(4292797418),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4288007423),
      surfaceTint: Color(4288007423),
      onPrimary: Color(4278203218),
      primaryContainer: Color(4278231282),
      onPrimaryContainer: Color(4278191630),
      secondary: Color(4288007423),
      onSecondary: Color(4278203218),
      secondaryContainer: Color(4278231282),
      onSecondaryContainer: Color(4278191630),
      tertiary: Color(4288007423),
      onTertiary: Color(4278203218),
      tertiaryContainer: Color(4278231282),
      onTertiaryContainer: Color(4278191630),
      error: Color(4294948010),
      onError: Color(4285071363),
      errorContainer: Color(4289076246),
      onErrorContainer: Color(4294964981),
      surface: Color(4279178265),
      onSurface: Color(4292797418),
      onSurfaceVariant: Color(4290693075),
      outline: Color(4287140509),
      outlineVariant: Color(4282271826),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797418),
      inversePrimary: Color(4278215577),
      primaryFixed: Color(4291683839),
      onPrimaryFixed: Color(4278197554),
      primaryFixedDim: Color(4288007423),
      onPrimaryFixedVariant: Color(4278209141),
      secondaryFixed: Color(4291683839),
      onSecondaryFixed: Color(4278197554),
      secondaryFixedDim: Color(4288007423),
      onSecondaryFixedVariant: Color(4278209141),
      tertiaryFixed: Color(4291683839),
      onTertiaryFixed: Color(4278197554),
      tertiaryFixedDim: Color(4288007423),
      onTertiaryFixedVariant: Color(4278209141),
      surfaceDim: Color(4279178265),
      surfaceBright: Color(4281678399),
      surfaceContainerLowest: Color(4278849300),
      surfaceContainerLow: Color(4279704609),
      surfaceContainer: Color(4279967781),
      surfaceContainerHigh: Color(4280625712),
      surfaceContainerHighest: Color(4281349435),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4288598271),
      surfaceTint: Color(4288007423),
      onPrimary: Color(4278196266),
      primaryContainer: Color(4278231282),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4288598271),
      onSecondary: Color(4278196266),
      secondaryContainer: Color(4278231282),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4288598271),
      onTertiary: Color(4278196266),
      tertiaryContainer: Color(4278231282),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949552),
      onError: Color(4281794561),
      errorContainer: Color(4294597194),
      onErrorContainer: Color(4278190080),
      surface: Color(4279178265),
      onSurface: Color(4294572799),
      onSurfaceVariant: Color(4290956504),
      outline: Color(4288324783),
      outlineVariant: Color(4286284943),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797418),
      inversePrimary: Color(4278209654),
      primaryFixed: Color(4291683839),
      onPrimaryFixed: Color(4278194722),
      primaryFixedDim: Color(4288007423),
      onPrimaryFixedVariant: Color(4278204763),
      secondaryFixed: Color(4291683839),
      onSecondaryFixed: Color(4278194722),
      secondaryFixedDim: Color(4288007423),
      onSecondaryFixedVariant: Color(4278204763),
      tertiaryFixed: Color(4291683839),
      onTertiaryFixed: Color(4278194722),
      tertiaryFixedDim: Color(4288007423),
      onTertiaryFixedVariant: Color(4278204763),
      surfaceDim: Color(4279178265),
      surfaceBright: Color(4281678399),
      surfaceContainerLowest: Color(4278849300),
      surfaceContainerLow: Color(4279704609),
      surfaceContainer: Color(4279967781),
      surfaceContainerHigh: Color(4280625712),
      surfaceContainerHighest: Color(4281349435),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294572799),
      surfaceTint: Color(4288007423),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4288598271),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294572799),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4288598271),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294572799),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4288598271),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965752),
      onError: Color(4278190080),
      errorContainer: Color(4294949552),
      onErrorContainer: Color(4278190080),
      surface: Color(4279178265),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294572799),
      outline: Color(4290956504),
      outlineVariant: Color(4290956504),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797418),
      inversePrimary: Color(4278201416),
      primaryFixed: Color(4292209151),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4288598271),
      onPrimaryFixedVariant: Color(4278196266),
      secondaryFixed: Color(4292209151),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4288598271),
      onSecondaryFixedVariant: Color(4278196266),
      tertiaryFixed: Color(4292209151),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4288598271),
      onTertiaryFixedVariant: Color(4278196266),
      surfaceDim: Color(4279178265),
      surfaceBright: Color(4281678399),
      surfaceContainerLowest: Color(4278849300),
      surfaceContainerLow: Color(4279704609),
      surfaceContainer: Color(4279967781),
      surfaceContainerHigh: Color(4280625712),
      surfaceContainerHighest: Color(4281349435),
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
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
    primaryColor: const Color(0xFF00A8FF),
    fontFamily: 'Roboto',
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF00A8FF),
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: elevatedButtonThemeData,
  );

  /// Contrast Color
  static const contrastColor = ExtendedColor(
    seed: Color(4294923060),
    value: Color(4294923060),
    light: ColorFamily(
      color: Color(4290256900),
      onColor: Color(4294967295),
      colorContainer: Color(4294929745),
      onColorContainer: Color(4280353024),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(4290256900),
      onColor: Color(4294967295),
      colorContainer: Color(4294929745),
      onColorContainer: Color(4280353024),
    ),
    lightHighContrast: ColorFamily(
      color: Color(4290256900),
      onColor: Color(4294967295),
      colorContainer: Color(4294929745),
      onColorContainer: Color(4280353024),
    ),
    dark: ColorFamily(
      color: Color(4294948005),
      onColor: Color(4284812032),
      colorContainer: Color(4292425756),
      onColorContainer: Color(4294967295),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(4294948005),
      onColor: Color(4284812032),
      colorContainer: Color(4292425756),
      onColorContainer: Color(4294967295),
    ),
    darkHighContrast: ColorFamily(
      color: Color(4294948005),
      onColor: Color(4284812032),
      colorContainer: Color(4292425756),
      onColorContainer: Color(4294967295),
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
