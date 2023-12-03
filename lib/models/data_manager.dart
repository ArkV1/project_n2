import 'package:flutter/material.dart';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_n2/models/shared_prefs.dart';

import 'package:project_n2/models/todo/todo_list.dart';
import 'package:project_n2/models/widgets/todo_widget.dart';
import 'package:project_n2/models/wallet/wallet_transaction.dart';
import 'package:project_n2/models/widgets/wallet_widget.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:project_n2/models/todo/todo_task.dart';

import 'package:project_n2/models/widgets/app_widget.dart';
import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/models/widgets/widget_union.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_manager.g.dart';

// int calculateDifference(DateTime date) {
//   DateTime now = DateTime.now();
//   return DateTime(date.year, date.month, date.day)
//       .difference(DateTime(now.year, now.month, now.day))
//       .inDays;
// }

@Riverpod(keepAlive: true)
class Database extends _$Database {
  Future<Isar> initDatabase() async {
    debugPrint('Initializing Database');
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        SharedPrefSchema,
        // WALLET COMPONENT
        WalletSchema,
        WalletTransactionSchema,
        // TODOS COMPONENT
        ToDoListSchema,
        ToDoTaskSchema,
        // WIDGETS
        AppWidgetSchema,
        WalletWidgetSchema,
        ToDoWidgetSchema,
      ],
      inspector: true,
      directory: dir.path,
    );
  }

  @override
  FutureOr<Isar> build() {
    return initDatabase();
  }
}



// class DataManager extends ChangeNotifier {
//   // SHARED PREFERENCES

//   // Future<List<SharedPrefs>> getSharedPrefs() async {
//   //   final Isar isar = db!;
//   //   return await isar.sharedPrefs.where().findAll();
//   // }

//   // String? getString(String key) {
//   //   try {
//   //     final value = sharedPrefs.singleWhere((map) => map.key == key).value;
//   //     return value;
//   //   } on StateError {
//   //     return null; // Return null if no matching key is found
//   //   }
//   // }

//   // Future<void> setString(String key, String value) async {
//   //   try {
//   //     await db!.writeTxn(() async {
//   //       final existingKeyValue =
//   //           await db!.sharedPrefs.where().filter().keyEqualTo(key).findFirst();

//   //       if (existingKeyValue != null) {
//   //         // Modify the existing object's value
//   //         existingKeyValue.value = value;
//   //         await db!.sharedPrefs.put(existingKeyValue);
//   //       } else {
//   //         // Create a new object and save it
//   //         final keyValue = SharedPrefs()
//   //           ..key = key
//   //           ..value = value;
//   //         await db!.sharedPrefs.put(keyValue);
//   //       }
//   //     });
//   //   } catch (e) {
//   //     print("Error in setString: $e");
//   //   }
//   // }

//   // List<String>? getStringList(String key) {
//   //   try {
//   //     final stringValue = getString(key);
//   //     return stringValue?.split(','); // Assuming comma-separated values
//   //   } on Exception {
//   //     return null;
//   //   }
//   // }

//   // Future<void> setStringList(String key, List<String> values) async {
//   //   try {
//   //     final stringValue = values.join(',');
//   //     await setString(key, stringValue);
//   //   } on Exception {
//   //     // Handle or log the error as required
//   //   }
//   // }

//   // bool? getBool(String key) {
//   //   try {
//   //     final stringValue = getString(key);
//   //     if (stringValue == '1') {
//   //       return true;
//   //     } else if (stringValue == '0') {
//   //       return false;
//   //     }
//   //     return null;
//   //   } on Exception {
//   //     return null;
//   //   }
//   // }

//   // Future<void> setBool(String key, bool value) async {
//   //   try {
//   //     await setString(key, value ? '1' : '0');
//   //   } on Exception {
//   //     // Handle or log the error as required
//   //   }
//   // }

//   // Future<void> remove(String key) async {
//   //   try {
//   //     await db!.writeTxn(() async {
//   //       await db!.sharedPrefs.where().filter().keyEqualTo(key).deleteFirst();
//   //       sharedPrefs.removeWhere((map) => map.key == key);
//   //     });
//   //   } catch (e) {
//   //     print("Error in remove: $e");
//   //   }
//   // }

// ///////////////////////////////////////////////////////////////////////////////////////
// //                                APP WIDGETS

// ///////////////////////////////////////////////////////////////////////////////////////
// //                                  WALLETS

// ///////////////////////////////////////////////////////////////////////////////////////
// //                                  TODOLISTS

//   // Future<void> reorderToDoTask(
//   //   int oldIndex,
//   //   int newIndex,
//   //   ToDoList toDoList,
//   // ) async {
//   //   debugPrint('New index: $newIndex');
//   //   debugPrint('Old index: $oldIndex');
//   //   final Isar isar = db!;

//   //   final list =
//   //       await isar.toDoLists.where().idEqualTo(toDoList.id).findFirst();

//   //   if (list != null) {
//   //     await list.tasksLink.load();
//   //     final tasks = list.tasks;

//   //     // Reorder the task in memory
//   //     tasks.insert(newIndex, tasks.removeAt(oldIndex));

//   //     int start = (oldIndex < newIndex) ? oldIndex : newIndex;
//   //     int end = (oldIndex > newIndex) ? oldIndex : newIndex;

//   //     await isar.writeTxn(() async {
//   //       for (int i = start; i <= end; i++) {
//   //         tasks[i].parentIndex = i;
//   //         await isar.toDoTasks.put(tasks[i]);
//   //       }
//   //     });

//   //     toDoLists = await getToDoLists();
//   //     notifyListeners();
//   //   }
//   // }

//   // OTHER

//   int calculateDifference(DateTime date) {
//     DateTime now = DateTime.now();
//     return DateTime(date.year, date.month, date.day)
//         .difference(DateTime(now.year, now.month, now.day))
//         .inDays;
//   }
// }
