import 'package:firebase_auth/firebase_auth.dart';

import 'package:shared_preferences/shared_preferences.dart';

class CustomModules {
  SharedPreferences prefs;
  bool? expenseManager;
  bool? calendar;
  bool? notebook;
  List<String>? moduleList;

  CustomModules(
    this.prefs, [
    this.expenseManager,
    this.calendar,
    this.notebook,
    this.moduleList,
  ]);

  void setModulesFromSharedPrefs() async {
    final expenseManager = prefs.getBool('expenseManager');
    final calendar = prefs.getBool('calendar');
    final notebook = prefs.getBool('notebook');
    final moduleList = prefs.getStringList('moduleList');
    if (expenseManager != null) {
      this.expenseManager = expenseManager;
    } else {
      this.expenseManager = true;
      prefs.setBool('expenseManager', true);
    }
    if (calendar != null) {
      this.calendar = calendar;
    } else {
      this.calendar = true;
      prefs.setBool('calendar', true);
    }
    if (notebook != null) {
      this.notebook = notebook;
    } else {
      this.notebook = true;
      prefs.setBool('notebook', true);
    }
    if (moduleList != null) {
      this.moduleList = moduleList;
    } else {
      this.moduleList = [
        'Expense Manager',
        'Calendar',
        'Notebook',
      ];
      prefs.setStringList('moduleList', this.moduleList!);
    }
  }

  void toggleModule(String? moduleName) async {
    switch (moduleName) {
      case 'Expense Manager':
        if (expenseManager != null) {
          expenseManager = !expenseManager!;
          if (expenseManager!) {
            moduleList!.add('Expense Manager');
          } else {
            moduleList!.remove('Expense Manager');
          }
        } else {
          expenseManager = false;
          moduleList!.remove('Expense Manager');
        }
        prefs.setStringList('moduleList', moduleList!);
        prefs.setBool('expenseManager', expenseManager!);
        break;
      case 'Calendar':
        if (calendar != null) {
          calendar = !calendar!;
          if (calendar!) {
            moduleList!.add('Calendar');
          } else {
            moduleList!.remove('Calendar');
          }
        } else {
          calendar = false;
          moduleList!.remove('Calendar');
        }
        prefs.setStringList('moduleList', moduleList!);
        prefs.setBool('calendar', calendar!);
        break;
      case 'Notebook':
        if (notebook != null) {
          notebook = !notebook!;
          if (notebook!) {
            moduleList!.add('Notebook');
          } else {
            moduleList!.remove('Notebook');
          }
        } else {
          notebook = false;
          moduleList!.remove('Notebook');
        }
        prefs.setStringList('moduleList', moduleList!);
        prefs.setBool('notebook', notebook!);
        break;
    }
  }
}
