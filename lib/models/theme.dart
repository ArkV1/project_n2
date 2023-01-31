import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class CustomTheme extends ChangeNotifier {
  Color? primaryColor;
  Color? primaryContrastingColor;
  ThemeMode? themeMode;
  SharedPreferences prefs;

  CustomTheme(this.prefs);

  void setThemeFromSharedPrefs() async {
    final darkTheme = prefs.getBool('darkTheme');
    final primaryColorFromSharedPrefs = prefs.getString('primaryColor');
    final primaryContrastingColorFromSharedPrefs =
        prefs.getString('primaryContrastingColor');
    if (darkTheme == null) {
      themeMode = ThemeMode.system;
    } else if (darkTheme == true) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    switch (primaryColorFromSharedPrefs) {
      case null:
        primaryColor = Colors.purple;
        break;
    }
    switch (primaryContrastingColorFromSharedPrefs) {
      case null:
        primaryContrastingColor = Colors.amber;
        break;
    }
  }

  void changeTheme(ThemeMode? newThemeMode, [String? isOLED]) async {
    themeMode = newThemeMode;
    if (newThemeMode == ThemeMode.system) {
      await prefs.remove('darkTheme');
    } else if (newThemeMode == ThemeMode.dark) {
      await prefs.setBool('darkTheme', true);
    } else {
      await prefs.setBool('darkTheme', false);
    }
    notifyListeners();
  }

  void changeColor(Color? newColor, bool contrastingColor) async {
    if (!contrastingColor) {
      primaryColor = newColor;
      // if (newColor == ThemeMode.system) {
      //   await prefs.remove('darkTheme');
      // } else if (newColor == ThemeMode.dark) {
      //   await prefs.setBool('darkTheme', true);
      // } else {
      //   await prefs.setBool('darkTheme', false);
      // }
    } else {
      primaryContrastingColor = newColor;
      //   if (newColor == ThemeMode.system) {
      //     await prefs.remove('darkTheme');
      //   } else if (newColor == ThemeMode.dark) {
      //     await prefs.setBool('darkTheme', true);
      //   } else {
      //     await prefs.setBool('darkTheme', false);
      // }
    }
    notifyListeners();
  }
}
