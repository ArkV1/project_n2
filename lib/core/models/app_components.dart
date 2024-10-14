import 'package:flutter/material.dart';
import 'package:project_n2/core/views/settings_view/dialogs/todo_dialog.dart';
import 'package:project_n2/core/views/settings_view/dialogs/wallet_dialog/wallets_dialog.dart';
import 'package:project_n2/features/notes/dialogs/notes_dialog.dart';
import 'package:project_n2/features/todo/models/views/todo_view.dart';
import 'package:project_n2/features/calendar/views/calendar_view.dart';
import 'package:project_n2/features/wallet/views/wallets_view.dart';
import 'package:project_n2/views/notes_view/notes_view.dart';

class AppComponent {
  final String name;
  final String publicName;
  final IconData icon;
  final String route;
  final Widget Function(BuildContext) viewBuilder;
  final Widget Function(BuildContext) dialogBuilder;
  final String efficiency;
  final String complexity;

  const AppComponent({
    required this.name,
    required this.publicName,
    required this.icon,
    required this.route,
    required this.viewBuilder,
    required this.dialogBuilder,
    required this.efficiency,
    required this.complexity,
  });
}

class AppComponents {
  static final todo = AppComponent(
    name: 'todo',
    publicName: 'To Do Lists',
    icon: Icons.format_list_bulleted,
    route: '/toDo',
    viewBuilder: (context) => ToDoView(),
    dialogBuilder: (context) => const ToDoListsDialog(),
    efficiency: 'Medium',
    complexity: 'Low',
  );

  static final calendar = AppComponent(
    name: 'calendar',
    publicName: 'Calendar',
    icon: Icons.calendar_month,
    route: '/calendar',
    viewBuilder: (context) => CalendarView(),
    dialogBuilder: (context) => const Text('Calendar settings dialog not implemented'),
    efficiency: 'High',
    complexity: 'Medium',
  );

  static final wallet = AppComponent(
    name: 'wallet',
    publicName: 'Wallets',
    icon: Icons.account_balance_wallet,
    route: '/wallets',
    viewBuilder: (context) => WalletView(),
    dialogBuilder: (context) => const WalletsDialog(),
    efficiency: 'High',
    complexity: 'Medium',
  );

  static final notes = AppComponent(
    name: 'notes',
    publicName: 'Notes',
    icon: Icons.note,
    route: '/notes',
    viewBuilder: (context) => NotesView(),
    dialogBuilder: (context) => const NotesDialog(),
    efficiency: 'High',
    complexity: 'Low',
  );

  static final List<AppComponent> values = [todo, calendar, wallet, notes];

  static AppComponent? getByName(String name) {
    return values.firstWhere((component) => component.name == name);
  }
}
