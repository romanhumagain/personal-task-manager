import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.dark(
      primary: Colors.blue,
      // Primary color
      secondary: Colors.black,
      // Secondary color
      tertiary: Colors.black38,
      // Tertiary color
      background: Colors.black,
      onBackground: Colors.white70,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onTertiary: Colors.white, // Color to contrast with tertiary
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.black,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey.shade200,
    ));
