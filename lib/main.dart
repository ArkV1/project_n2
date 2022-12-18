// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return Platform.isIOS 
      ? CupertinoApp (
        title: 'Personal Expenses',
        theme: CupertinoThemeData(
          primaryColor: Colors.purple,
          primaryContrastingColor: Colors.orange,
        ),
        home: HomeScreen(),
      )
      : MaterialApp(
        title: 'Personal Expenses',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          colorScheme: theme.colorScheme.copyWith(
            primary: Colors.purple,
            secondary: Colors.orange,
          ),
          fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        home: HomeScreen(),
    );
  }
}