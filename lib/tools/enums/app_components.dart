import 'package:flutter/material.dart';

enum AppComponents {
  todo(
    publicName: 'To Do Lists',
    icon: Icons.format_list_bulleted,
    route: '/toDo',
  ),
  calendar(
    publicName: 'Calendar',
    icon: Icons.calendar_month,
    route: '/calendar',
  ),
  wallet(
    publicName: 'Wallets',
    icon: Icons.account_balance_wallet,
    route: '/wallets',
  );

  const AppComponents({
    required this.publicName,
    required this.icon,
    required this.route,
  });
  final String publicName;
  final IconData icon;
  final String route;
}

// enum AppComponents {
//   // Time Management
//   //clock(publicName: 'Clock'), // -> Clock, Timer, Stopwatch
//   todo(publicName: 'To Do Lists'),
//   calendar(publicName: 'Calendar'),
//   // Finance Management
//   wallet(publicName: 'Wallets'),
//   //converter(publicName: 'Currency\nConverter')
//   //finTrends(publicName: 'Financial Trends'), // -> Crypto trends, Stocks, etc
//   //expenseManager(publicName: 'Expense Manager'), // -> More complex wallet implementation with some AI functionality
//   // Information Management
//   //notebook(publicName: 'Notebooks'),

//   ;

//   const AppComponents({
//     required this.publicName,
//   });
//   final String publicName;
// }
