import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_task/theme/dark_mode.dart';
import 'package:quick_task/theme/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get getMode => _isDarkMode;

  void updateTheme({required bool value}) {
    if (value) {
      _isDarkMode = value;
      _themeData = darkMode;
    } else {
      _isDarkMode = value;
      _themeData = lightMode;
    }

    notifyListeners();
  }
}
