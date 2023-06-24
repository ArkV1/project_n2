// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
    return Platform.isIOS
        ?
        // IOS
        CupertinoApp(
            title: 'project_n2',
            theme: CupertinoThemeData(
              brightness: Brightness.light,
              primaryColor: Color(primaryColor['num']),
              primaryContrastingColor: Color(secondaryColor['num']),
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => const HomeScreen(),
              '/settings': (context) => SettingsScreen(),
            },
          )
        :
        // ANDROID
        MaterialApp(
            title: 'project_n2',
            theme: ThemeData(
              brightness: Brightness.light,
              // LIGHT
              colorScheme: ColorScheme.light(
                primary: Color(primaryColor['num']),
                secondary: Color(secondaryColor['num']),
              ),
              fontFamily: 'Quicksand',
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              // DARK
              colorScheme: ColorScheme.dark(
                primary: Color(primaryColor['num']),
                secondary: Color(secondaryColor['num']),
              ),
              fontFamily: 'Quicksand',
            ),
            themeMode: themeMode,
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/': (context) => const HomeScreen(),
              '/settings': (context) => SettingsScreen(),
              '/settings/personalization': (context) => PersonalizationSettingsScreen(),
            },
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
