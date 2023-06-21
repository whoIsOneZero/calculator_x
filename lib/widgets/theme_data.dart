import 'package:flutter/material.dart';

/// Cool the current theme
bool iconBool = false;

/// Icons that are switched on theme change - "themeIcons"
IconData iconLight = Icons.light_mode_outlined;
IconData iconDark = Icons.dark_mode_outlined;

/// Default color for light theme
Color myTextColor = Colors.black;

/// Default container color for light theme
Color myContainerColor = Colors.white;

///Light theme properties
ThemeData myLightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  scaffoldBackgroundColor: const Color(0xFFFAFAFA),
  primaryColorDark: Colors.black,
  iconTheme: const IconThemeData().copyWith(color: Colors.white),
  textTheme: const TextTheme(
    displayMedium: TextStyle(
      color: Colors.black,
      fontSize: 26.0,
      fontWeight: FontWeight.bold,
    ),
  ),
);

///Dark theme properties
ThemeData myDarkTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0x9F000000),
  primaryColor: Colors.black,
  primaryColorDark: Colors.white,
  iconTheme: const IconThemeData().copyWith(color: Colors.black),
  brightness: Brightness.dark,
  textTheme: const TextTheme(
    displayMedium: TextStyle(
      color: Colors.white,
      fontSize: 26.0,
      fontWeight: FontWeight.bold,
    ),
  ),
);
