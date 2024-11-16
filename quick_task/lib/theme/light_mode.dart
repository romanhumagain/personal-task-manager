import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: Colors.blue,
      // Primary color
      secondary: Colors.orange,
      // Secondary color
      tertiary: Colors.grey.shade200,
      // Tertiary color
      background: Colors.white,
      onBackground: Colors.black,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onTertiary: Colors.black, // Color to contrast with tertiary
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey.shade200,
    ));
