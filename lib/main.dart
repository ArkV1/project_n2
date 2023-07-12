// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:project_n2/models/data_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/providers.dart';
import 'providers/theme_providers.dart';
import 'providers/store_providers.dart';

import 'package:in_app_purchase/in_app_purchase.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/personalization_settings_screen.dart';

//////////////////////////////////////////////////////////////////////////

// loadBundle(FirebaseFirestore db) async {
//   print('Loading Data Bundle');
//   ByteData bytes = await rootBundle.load("assets/dataBundle.txt");
//   Uint8List buffer =
//       bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
//   db.loadBundle(buffer).stream.last;
//   print('Data Bundle loaded');
// }

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

  runApp(
    ProviderScope(
      overrides: [
        prefsProvider.overrideWithValue(prefs),
      ],
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
  late StreamSubscription<List<PurchaseDetails>> _subscription;

  void _initialize() async {
    final inAppPurchases = InAppPurchase.instance;
    //if (await inAppPurchases.isAvailable()) {
    final purchaseUpdated = inAppPurchases.purchaseStream;
    _subscription = purchaseUpdated.listen((purchaseDetailsList) {
      _listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      _subscription.cancel();
    }, onError: (error) {
      // handle error here.
    });
    await InAppPurchase.instance.restorePurchases();
    // } else {
    //   ref.read(purchaseDetailsProvider.notifier).state = [];
    // }
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);
    final primaryColor = ref.watch(primaryColorProvider);
    final secondaryColor = ref.watch(secondaryColorProvider);
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
    final cupertinoLightTheme =
        MaterialBasedCupertinoThemeData(materialTheme: materialLightTheme);
    const darkDefaultCupertinoTheme =
        CupertinoThemeData(brightness: Brightness.dark);
    final cupertinoDarkTheme = MaterialBasedCupertinoThemeData(
      materialTheme: materialDarkTheme.copyWith(
        cupertinoOverrideTheme: CupertinoThemeData(
          brightness: Brightness.dark,
          barBackgroundColor: darkDefaultCupertinoTheme.barBackgroundColor,
          textTheme: CupertinoTextThemeData(
            primaryColor: Colors.white,
            navActionTextStyle:
                darkDefaultCupertinoTheme.textTheme.navActionTextStyle.copyWith(
              color: const Color(0xF0F9F9F9),
            ),
            navLargeTitleTextStyle: darkDefaultCupertinoTheme
                .textTheme.navLargeTitleTextStyle
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
        builder: (context) => PlatformApp(
          title: 'project_n2',
          initialRoute: '/',
          routes: {
            '/': (context) => const HomeScreen(),
            '/settings': (context) => SettingsScreen(),
            '/settings/personalization': (context) =>
                PersonalizationSettingsScreen(),
          },
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

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  void _listenToPurchaseUpdated(
      List<PurchaseDetails> purchaseDetailsList) async {
    for (var purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        //_showPendingUI();
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          //_handleError(purchaseDetails.error!);
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          ref.read(purchaseDetailsProvider).add(purchaseDetails);
          //bool valid = await _verifyPurchase(purchaseDetails);
          //if (valid) {
          _deliverProduct(purchaseDetails);
          //} else {
          //  _handleInvalidPurchase(purchaseDetails);
          //}
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await InAppPurchase.instance.completePurchase(purchaseDetails);
        }
      }
    }
  }

  void _deliverProduct(PurchaseDetails purchaseDetails) async {
    switch (purchaseDetails.productID) {
      case 'productId':
        debugPrint('User bought productId');
        break;
      default:
        break;
    }
  }
}
