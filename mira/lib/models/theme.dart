import 'package:flutter/material.dart';

class MiraColors {
  static const Color verdeSalvia = Color(0xFFA8C3B4);
  static const Color verdeEscuro = Color(0xFF3F5E52);
  static const Color areiaDourada = Color(0xFFDCC48E);
  static const Color offWhite = Color(0xFFF8F6F4);
  static const Color cinzaFume = Color(0xFF737373);
}

final ThemeData miraLightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: MiraColors.verdeEscuro,
  scaffoldBackgroundColor: MiraColors.offWhite,
  appBarTheme: AppBarTheme(
    backgroundColor: MiraColors.verdeSalvia,
    foregroundColor: MiraColors.verdeEscuro,
    elevation: 0,
  ),
  colorScheme: ColorScheme.light(
    primary: MiraColors.verdeEscuro,
    secondary: MiraColors.areiaDourada,
    surface: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Color(0xFF1C1C1E),
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      color: MiraColors.verdeEscuro,
      fontWeight: FontWeight.bold,
      fontFamily: 'Nunito',
    ),
    bodyMedium: TextStyle(color: MiraColors.cinzaFume),
  ),
);

final ThemeData miraDarkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: MiraColors.verdeSalvia,
  scaffoldBackgroundColor: Color(0xFF1C1C1E),
  appBarTheme: AppBarTheme(
    backgroundColor: MiraColors.verdeEscuro,
    foregroundColor: MiraColors.offWhite,
    elevation: 0,
  ),
  colorScheme: ColorScheme.dark(
    primary: MiraColors.verdeSalvia,
    secondary: MiraColors.areiaDourada,
    surface: MiraColors.verdeEscuro,
    onPrimary: Color(0xFF1C1C1E),
    onSecondary: Colors.white,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      color: MiraColors.offWhite,
      fontWeight: FontWeight.bold,
      fontFamily: 'Nunito',
    ),
    bodyMedium: TextStyle(color: MiraColors.areiaDourada),
  ),
);
