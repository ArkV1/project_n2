import 'package:collection/collection.dart';

enum AppComponents {
  //calendar(publicName: 'Calendar'),
  //notebook(publicName: 'Notebooks'),
  todo(publicName: 'To Do Lists'),
  wallet(publicName: 'Wallets'),
  //converter(publicName: 'Currency\nConverter')
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
