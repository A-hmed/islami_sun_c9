import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{
  String currentLocale = "en";
  ThemeMode currentMode = ThemeMode.light;

  bool isAr() => currentLocale == "ar";
  bool isDarkMode() => currentMode == ThemeMode.dark;

  ThemeMode setCurrentMode(bool isDark){
    return currentMode = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  String setCurrentLocale(bool isAr){
    return currentLocale = isAr ? "ar" : "en";
  }

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}