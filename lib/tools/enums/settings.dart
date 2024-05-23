import 'package:collection/collection.dart';

enum AppComponents {
  // Time Management
  //clock(publicName: 'Clock'), // -> Clock, Timer, Stopwatch
  todo(publicName: 'To Do Lists'),
  calendar(publicName: 'Calendar'),
  // Finance Management
  wallet(publicName: 'Wallets'),
  //converter(publicName: 'Currency\nConverter')
  //finTrends(publicName: 'Financial Trends'), // -> Crypto trends, Stocks, etc
  //expenseManager(publicName: 'Expense Manager'), // -> More complex wallet implementation with some AI functionality
  // Information Management
  //notebook(publicName: 'Notebooks'),

  ;

  const AppComponents({
    required this.publicName,
  });
  final String publicName;
}

enum Screens {
  home(publicName: 'Home', path: '/home'),
  wallets(publicName: 'Wallet', path: '/wallets'),
  toDo(publicName: 'To Do', path: '/toDo'),
  settings(publicName: 'Settings', path: '/settings'),
  personaliztion(publicName: 'Personalization', path: '/personalization'),
  ;

  const Screens({
    required this.publicName,
    required this.path,
  });

  final String publicName;
  final String path;

  static Screens? fromPath(String path) {
    return Screens.values.singleWhereOrNull((element) => element.path == path);
  }
}
