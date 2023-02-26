// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'firebase_options.dart';

import './models/theme.dart';
import './models/module.dart';
import './models/user.dart';

import './screens/home_screen.dart';

//////////////////////////////////////////////////////////////////////////

loadBundle(FirebaseFirestore db) async {
  print('Loading Data Bundle');
  ByteData bytes = await rootBundle.load("assets/dataBundle.txt");
  Uint8List buffer =
      bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
  db.loadBundle(buffer).stream.last;
  print('Data Bundle loaded');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // GET LOCAL DATA

  final prefs = await SharedPreferences.getInstance();

  //////////////////////////////////////////////////////////////////////////
  ///                              FIREBASE                              ///
  //////////////////////////////////////////////////////////////////////////

  // INIT FIREBASE

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).whenComplete(
    () => print('Firebase Initialized'),
  );

  // INIT FIREBASE SERVICES

  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  // INIT SERVICES

  final theme = CustomTheme(prefs);
  final user = CustomUser(prefs, auth);
  final modules = CustomModules(prefs);

  // LOAD OFFLINE FIRESTORE BUNDLE

  loadBundle(db);

  // FIRESTORE SETTINGS (OFFLINE ONLY)

  db.settings = const Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  );

  //db.disableNetwork();

  //////////////////////////////////////////////////////////////////////////

  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);

  //////////////////////////////////////////////////////////////////////////

  runApp(MyApp(theme, user, modules, db, storage));
}

class MyApp extends StatefulWidget {
  final CustomTheme theme;
  final CustomUser user;
  final CustomModules modules;
  final FirebaseFirestore db;
  final FirebaseStorage storage;

  const MyApp(this.theme, this.user, this.modules, this.db, this.storage,
      {super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  late final theme = widget.theme;
  late final prefs = theme.prefs;
  late final user = widget.user;
  late final modules = widget.modules;
  late final db = widget.db;
  late final storage = widget.storage;

///////////////////////////////////////////////////////////////////////////////////////////////

  @override
  void initState() {
    super.initState();
    theme.setThemeFromSharedPrefs();
    modules.setModulesFromSharedPrefs();
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
        value: theme,
        child: Consumer<CustomTheme>(
          builder: (context, state, child) {
            print('Theme Mode is: ${theme.themeMode}');
            return MultiProvider(
              providers: [
                Provider<CustomUser>.value(value: user),
                Provider<CustomModules>.value(value: modules),
                Provider<FirebaseFirestore>.value(value: db),
                Provider<FirebaseStorage>.value(value: storage),
              ],
              child: Platform.isIOS
                  ?
                  // IOS
                  CupertinoApp(
                      title: 'Quizzin',
                      theme: CupertinoThemeData(
                        brightness: Brightness.light,
                        primaryColor: theme.primaryColor,
                        primaryContrastingColor: theme.primaryContrastingColor,
                      ),
                      home: HomeScreen())
                  :
                  // ANDROID
                  MaterialApp(
                      title: 'Quizzin',
                      theme: ThemeData(
                        brightness: Brightness.light,
                        // LIGHT
                        colorScheme: ColorScheme.light(
                          primary: theme.primaryColor!,
                          secondary: theme.primaryContrastingColor!,
                        ),
                        fontFamily: 'Quicksand',
                      ),
                      darkTheme: ThemeData(
                        brightness: Brightness.dark,
                        // DARK
                        colorScheme: ColorScheme.dark(
                          primary: theme.primaryColor!,
                          secondary: theme.primaryContrastingColor!,
                        ),
                        fontFamily: 'Quicksand',
                      ),
                      themeMode: theme.themeMode,
                      debugShowCheckedModeBanner: false,
                      home: HomeScreen(),
                    ),
            );
          },
        ),
      );
}
