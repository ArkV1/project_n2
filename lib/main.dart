// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './screens/home_screen.dart';
//import './screens/wallet_screen.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode? themeMode;
  Color? primaryColor;
  Color? primaryContrastingColor;

  Future<void> _setThemeFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final darkTheme = prefs.getBool('darkTheme');
    final primaryColor = prefs.getString('primaryColor');
    final primaryContrastingColor = prefs.getString('primaryContrastingColor');
    setState(() {
      if (darkTheme == null) {
        themeMode = ThemeMode.system;
      } else if (darkTheme == true) {
        themeMode = ThemeMode.dark;
      } else {
        themeMode = ThemeMode.light;
      }

      switch (primaryColor) {
        case null:
          this.primaryColor = Colors.purple;
          break;
      }

      switch (primaryContrastingColor) {
        case null:
          this.primaryContrastingColor = Colors.amber;
          break;
      }
    });
  }

  void changeTheme(ThemeMode? newThemeMode) async {
    setState(() {
      themeMode = newThemeMode;
    });
    final prefs = await SharedPreferences.getInstance();
    if (newThemeMode == ThemeMode.system) {
      await prefs.remove('darkTheme');
    } else if (newThemeMode == ThemeMode.dark) {
      await prefs.setBool('darkTheme', true);
    } else {
      await prefs.setBool('darkTheme', false);
    }
  }

    void changeColor(Color? newColor, bool contrastingColor) async {
    if (!contrastingColor) {
      setState(() {
        primaryColor = newColor;
      });
      final prefs = await SharedPreferences.getInstance();
      // if (newColor == ThemeMode.system) {
      //   await prefs.remove('darkTheme');
      // } else if (newColor == ThemeMode.dark) {
      //   await prefs.setBool('darkTheme', true);
      // } else {
      //   await prefs.setBool('darkTheme', false);
      // }
    } else {
      setState(() {
        primaryContrastingColor = newColor;
      });
      final prefs = await SharedPreferences.getInstance();
      //   if (newColor == ThemeMode.system) {
      //     await prefs.remove('darkTheme');
      //   } else if (newColor == ThemeMode.dark) {
      //     await prefs.setBool('darkTheme', true);
      //   } else {
      //     await prefs.setBool('darkTheme', false);
      // }
    }
  }

  @override
  void initState() {
    super.initState();
    _setThemeFromSharedPref();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return Platform.isIOS
        ? CupertinoApp(
            title: 'Personal Expenses',
            theme: CupertinoThemeData(
              primaryColor: primaryColor!,
              primaryContrastingColor: primaryContrastingColor,
            ),
            home: HomeScreen(),
          )
        : MaterialApp(
            title: 'Personal Expenses',
            theme: ThemeData(
              //primarySwatch: Colors.purple,
              colorScheme: theme.colorScheme.copyWith(
                primary: primaryColor!,
                secondary: primaryContrastingColor!,
              ),
              fontFamily: 'Quicksand',
              appBarTheme: AppBarTheme(
                titleTextStyle: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              // DARK
              colorScheme: ColorScheme.dark(
                primary: primaryColor!,
                secondary: primaryContrastingColor!,
              ),
              fontFamily: 'Quicksand',
            ),
            themeMode: themeMode,
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
          );
  }
}
