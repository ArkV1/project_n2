// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_n2/models/shared_prefs.dart';
import 'package:project_n2/router.dart';
import 'package:project_n2/tools/enums/settings.dart';
import 'firebase_options.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:project_n2/models/in_app_purchases.dart';
import 'package:project_n2/models/objectbox.dart';
import 'package:project_n2/models/app_settings.dart';
import 'package:project_n2/models/todo/todo_list.dart';

// import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:project_n2/widgets/main_layout.dart';
import 'package:project_n2/screens/settings_screen.dart';
import 'package:project_n2/screens/personalization_settings_screen.dart';

import 'package:project_n2/tools/constants.dart';

import 'package:project_n2/objectbox.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await DataManager.instance.init();

  //////////////////////////////////////////////////////////////////////////
  ///                              FIREBASE                              ///
  //////////////////////////////////////////////////////////////////////////

  // INIT FIREBASE

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).whenComplete(
    () => debugPrint('Firebase Initialized'),
  );

  // LOAD OFFLINE FIRESTORE BUNDLE
  final db = FirebaseFirestore.instance;
  // await loadBundle(db);

  // FIRESTORE SETTINGS (OFFLINE ONLY)
  db.settings = const Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  );

  db.disableNetwork();

  // INIT MOBILE ADS SDK
  // MobileAds.instance.initialize();

  //////////////////////////////////////////////////////////////////////////

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  //////////////////////////////////////////////////////////////////////////

  // final docsDir = await getApplicationDocumentsDirectory();
  // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
  // final store = await openStore(
  //   directory: path.join(docsDir.path, "objectbox"),
  // );

  await ObjectBox.init();

  // if (Admin.isAvailable()) {
  //   _admin = Admin(store);
  // }

  runApp(
    ProviderScope(
      // overrides: [],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    ref.read(inAppPurchasesManagerProvider.notifier).initialize();
    if (ref.read(componentMapProvider)[AppComponents.todo.name] == true) {
      ref.read(toDoListsProvider.notifier).updateDailyTasksRoutine();
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = ref.watch(themeManagerProvider);
    final themeMode = themeManager.themeMode;
    final primaryColor = themeManager.primaryColor;
    final secondaryColor = themeManager.primaryContrastingColor;
    ///////////////////////////////////////////////////////////////////////////////
    // MATERIAL THEME
    final materialLightTheme = ThemeData(
      brightness: Brightness.light,
      // LIGHT
      colorScheme: ColorScheme.light(
        primary: Color(primaryColor['num']),
        secondary: Color(secondaryColor['num']),
      ),
      fontFamily: 'Quicksand',
    );
    final materialDarkTheme = ThemeData(
      brightness: Brightness.dark,
      // DARK
      colorScheme: ColorScheme.dark(
        primary: Color(primaryColor['num']),
        secondary: Color(secondaryColor['num']),
      ),
      fontFamily: 'Quicksand',
    );
    // CUPERTINO THEME
    final cupertinoLightTheme = MaterialBasedCupertinoThemeData(materialTheme: materialLightTheme);
    const darkDefaultCupertinoTheme = CupertinoThemeData(brightness: Brightness.dark);
    final cupertinoDarkTheme = MaterialBasedCupertinoThemeData(
      materialTheme: materialDarkTheme.copyWith(
        cupertinoOverrideTheme: CupertinoThemeData(
          brightness: Brightness.dark,
          barBackgroundColor: darkDefaultCupertinoTheme.barBackgroundColor,
          textTheme: CupertinoTextThemeData(
            primaryColor: Colors.white,
            navActionTextStyle: darkDefaultCupertinoTheme.textTheme.navActionTextStyle.copyWith(
              color: const Color(0xF0F9F9F9),
            ),
            navLargeTitleTextStyle: darkDefaultCupertinoTheme.textTheme.navLargeTitleTextStyle
                .copyWith(color: const Color(0xF0F9F9F9)),
          ),
        ),
      ),
    );
    ///////////////////////////////////////////////////////////////////////////////
    return PlatformProvider(
      initialPlatform: TargetPlatform.android,
      settings: PlatformSettingsData(
        iosUsesMaterialWidgets: true,
        iosUseZeroPaddingForAppbarPlatformIcon: true,
      ),
      builder: (context) => PlatformTheme(
        themeMode: themeMode,
        materialLightTheme: materialLightTheme,
        materialDarkTheme: materialDarkTheme,
        cupertinoLightTheme: cupertinoLightTheme,
        cupertinoDarkTheme: cupertinoDarkTheme,
        matchCupertinoSystemChromeBrightness: true,
        // onThemeModeChanged: (themeMode) {
        //   this.themeMode = themeMode; /* you can save to storage */
        // },
        builder: (context) => PlatformApp.router(
          title: 'project_n2',
          routerConfig: router,
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: true,
        ),
      ),
    );
  }
}
