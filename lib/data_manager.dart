import 'package:flutter/material.dart';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_n2/models/shared_prefs.dart';

import 'package:project_n2/models/todo/todo_list.dart';
import 'package:project_n2/models/todo/todo_widget.dart';
import 'package:project_n2/models/wallet/wallet_transaction.dart';
import 'package:project_n2/models/wallet/wallet_widget.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:project_n2/models/todo/todo_task.dart';

import 'package:project_n2/models/app_widget.dart';
import 'package:project_n2/models/wallet/wallet.dart';

class DataManager extends ChangeNotifier {
  static final DataManager _instance = DataManager._privateConstructor();
  Isar? db;

  List<SharedPrefs> sharedPrefs = [];

  List<AppWidget> appWidgets = [];
  List<ToDoList> toDoLists = [];
  List<Wallet> wallets = [];

  DataManager._privateConstructor();

  static DataManager get instance => _instance;

  init() async {
    await openIsar();
    // final dir = await getApplicationDocumentsDirectory();
    // final Isar isar = Isar.open([
    //   WalletSchema,
    //   WalletTransactonSchema,
    //   WalletWidgetSchema,
    //   ToDoListSchema,
    //   ToDoTaskSchema,
    //   ToDoWidgetSchema,
    // ], directory: directory);

    // TO DO
    // ToDoList defaultToDoList = ToDoList(
    //   id: 'defaultToDoList',
    //   name: 'DefaultToDoList',
    //   // tasks: [],
    // );
    // ToDoTask exampleTask = ToDoTask(
    //   id: 'exampleTask',
    //   toDoListId: defaultToDoList.id ?? 'defaultToDoList',
    //   task: 'task',
    // );
    // defaultToDoList.tasks.add(exampleTask);
    // WALLETS
    // Wallet defaultWallet = Wallet(
    //   id: 'defaultWallet',
    //   name: 'DefaultWallet',
    //   transactions: [],
    // );
    // WalletTransacton exampleTransaction = WalletTransacton(
    //   id: 'exampleTransaction',
    //   walletId: defaultWallet.id ?? 'defaultWallet',
    //   name: 'Burger',
    //   amount: '35',
    // );
    // defaultWallet.transactions.add(exampleTransaction);

    //  WIDGETS

    // WalletWidget defaultWalletWidget = WalletWidget(
    //   id: 'defaultWallet',
    //   parentIndex: 0,
    //   parentId: 'mainScreen',
    //   walletId: defaultWallet.id!,
    //   widgetType: WalletWidgetType.total,
    // );

    // In testing

    // ToDoWidget(
    //   id: 'defaultToDoList',
    //   parentIndex: 0,
    //   parentId: 'mainScreen',
    //   toDoListId: defaultToDoList.id!,
    //   widgetType: ToDoWidgetType.classic,
    // );

    // db = await openDatabase(
    //   'projectN2.db',
    //   onCreate: (db, version) async {
    //     Batch batch = db.batch();

    //     //
    //     batch.execute(
    //         'CREATE TABLE toDoLists(id TEXT PRIMARY KEY, name TEXT, tasksJSON TEXT)');
    //     // batch.execute(
    //     //     'CREATE TABLE toDoTasks(id TEXT PRIMARY KEY, toDoListId TEXT, task TEXT, description TEXT, complete INTEGER, creationDate TEXT, completionDate TEXT)');
    //     batch.insert('toDoLists', defaultToDoList.toMap());
    //     //batch.insert('toDoTasks', exampleTask.toMap());
    //     //
    //     batch.execute(
    //         'CREATE TABLE wallets(id TEXT PRIMARY KEY, name TEXT, transactionsJSON TEXT)');
    //     // batch.execute(
    //     //     'CREATE TABLE transactions(id TEXT PRIMARY KEY, walletId TEXT, name TEXT, amount TEXT)');
    //     batch.execute(
    //         'CREATE TABLE appWidgets(id TEXT PRIMARY KEY, parentId TEXT, parentIndex INTEGER, containedObjectId TEXT, containedObjectType TEXT, widgetType INTEGER, widgetSettingJSON TEXT)');
    //     batch.insert('wallets', defaultWallet.toMap());
    //     batch.insert('appWidgets', defaultWalletWidget.toMap());
    //     await batch.commit(noResult: true);
    //     // Run the CREATE TABLE statement on the database.
    //     // db
    //     //     .execute(
    //     //       'CREATE TABLE appWidgets(id TEXT PRIMARY KEY, name TEXT)',
    //     //     )
    //     //     .then((value) => db.insert('appWidgets', defaultWallet.toMap()));
    //     // return db
    //     //     .execute(
    //     //       'CREATE TABLE wallets(id TEXT PRIMARY KEY, name TEXT)',
    //     //     )
    //     //     .then((value) => db.insert('wallets', defaultWallet.toMap()));
    //   },
    //   version: 1,
    // );

    sharedPrefs = await getSharedPrefs();
    appWidgets = await getAppWidgets();
    wallets = await getWallets();
    toDoLists = await getToDoLists();
    notifyListeners();
    updateDailyTasksRoutine();
  }

  Future<void> openIsar() async {
    if (db == null) {
      final dir = await getApplicationDocumentsDirectory();
      if (!Isar.instanceNames.contains('default')) {
        db = await Isar.open(
          [
            SharedPrefsSchema,
            WalletSchema,
            WalletTransactionSchema,
            WalletWidgetSchema,
            ToDoListSchema,
            ToDoTaskSchema,
            ToDoWidgetSchema,
          ],
          inspector: true,
          directory: dir.path,
        );
      }
    }
  }

  // SHARED PREFERENCES

  Future<List<SharedPrefs>> getSharedPrefs() async {
    final Isar isar = db!;
    return await isar.sharedPrefs.where().findAll();
  }

  String? getString(String key) {
    try {
      final value = sharedPrefs.singleWhere((map) => map.key == key).value;
      return value;
    } on StateError {
      return null; // Return null if no matching key is found
    }
  }

  Future<void> setString(String key, String value) async {
    try {
      await db!.writeTxn(() async {
        final existingKeyValue =
            await db!.sharedPrefs.where().filter().keyEqualTo(key).findFirst();

        if (existingKeyValue != null) {
          // Modify the existing object's value
          existingKeyValue.value = value;
          await db!.sharedPrefs.put(existingKeyValue);
        } else {
          // Create a new object and save it
          final keyValue = SharedPrefs()
            ..key = key
            ..value = value;
          await db!.sharedPrefs.put(keyValue);
        }
      });
    } catch (e) {
      print("Error in setString: $e");
    }
  }

  List<String>? getStringList(String key) {
    try {
      final stringValue = getString(key);
      return stringValue?.split(','); // Assuming comma-separated values
    } on Exception {
      return null;
    }
  }

  Future<void> setStringList(String key, List<String> values) async {
    try {
      final stringValue = values.join(',');
      await setString(key, stringValue);
    } on Exception {
      // Handle or log the error as required
    }
  }

  bool? getBool(String key) {
    try {
      final stringValue = getString(key);
      if (stringValue == '1') {
        return true;
      } else if (stringValue == '0') {
        return false;
      }
      return null;
    } on Exception {
      return null;
    }
  }

  Future<void> setBool(String key, bool value) async {
    try {
      await setString(key, value ? '1' : '0');
    } on Exception {
      // Handle or log the error as required
    }
  }

  Future<void> remove(String key) async {
    try {
      await db!.writeTxn(() async {
        await db!.sharedPrefs.where().filter().keyEqualTo(key).deleteFirst();
        sharedPrefs.removeWhere((map) => map.key == key);
      });
    } catch (e) {
      print("Error in remove: $e");
    }
  }

///////////////////////////////////////////////////////////////////////////////////////
//                                APP WIDGETS

  Future<List<AppWidget>> getAppWidgets() async {
    final Isar isar = db!;
    List<AppWidget> combinedWidgets = [];
    combinedWidgets.addAll(await isar.toDoWidgets.where().findAll());
    combinedWidgets.addAll(await isar.walletWidgets.where().findAll());
    return combinedWidgets;
  }

  Future<void> insertAppWidget(AppWidget appWidget) async {
    final Isar isar = db!;
    await isar.writeTxn(() async {
      if (appWidget is ToDoWidget) {
        await isar.toDoWidgets.put(appWidget);
      } else if (appWidget is WalletWidget) {
        await isar.walletWidgets.put(appWidget);
      }
    });
    appWidgets = await getAppWidgets();
    notifyListeners();
  }

  Future<void> reorderInParentList(
    int oldIndex,
    int newIndex,
    List<AppWidget> parentWidgetsList,
  ) async {
    final Isar isar = db!;
    await isar.writeTxn(() async {
      final appWidget = parentWidgetsList.removeAt(oldIndex);
      parentWidgetsList.insert(newIndex, appWidget);
      for (int i = 0; i < parentWidgetsList.length; i++) {
        parentWidgetsList[i].parentIndex = i;
        final widget = parentWidgetsList[i];
        if (widget is WalletWidget) {
          await isar.walletWidgets.put(widget);
        } else if (widget is ToDoWidget) {
          await isar.toDoWidgets.put(widget);
        }
      }
    });
    appWidgets = await getAppWidgets();
    notifyListeners();
  }

  Future<void> deleteAppWidget(AppWidget appWidget) async {
    final Isar isar = db!;
    await isar.writeTxn(() async {
      if (appWidget is WalletWidget) {
        await isar.walletWidgets.delete(appWidget.id);
      } else if (appWidget is ToDoWidget) {
        await isar.toDoWidgets.delete(appWidget.id);
      }
    });
    appWidgets = await getAppWidgets();
    notifyListeners();
  }

///////////////////////////////////////////////////////////////////////////////////////
//                                  WALLETS

// A method that retrieves all the wallets from Isar.
  Future<List<Wallet>> getWallets() async {
    final Isar isar = db!;
    return await isar.wallets.where().findAll();
  }

  Future<void> insertWallet(Wallet wallet) async {
    final Isar isar = db!;
    await isar.writeTxn(() => isar.wallets.put(wallet));
    wallets = await getWallets();
    notifyListeners();
  }

  Future<void> insertWalletTransaction(
    WalletTransaction transaction, {
    bool notify = true,
  }) async {
    final Isar isar = db!;

    await isar.writeTxn(() async {
      transaction.id = await isar.walletTransactions.put(transaction);

      // Fetch the related wallet
      final currentWallet = await isar.wallets
          .where()
          .idEqualTo(transaction.walletId)
          .findFirst();

      if (currentWallet != null) {
        // Add the transaction to the transactionsLink of the retrieved wallet
        currentWallet.transactionsLink.add(transaction);

        // Save the updated transactionsLink
        await currentWallet.transactionsLink.save();
      }
    });

    wallets = await getWallets();
    if (notify) notifyListeners();
  }

  Future<void> deleteWallet(Wallet wallet) async {
    final Isar isar = db!;
    await isar.writeTxn(() => isar.wallets.delete(wallet.id));
    wallets = await getWallets();
    notifyListeners();
  }

  Future<void> deleteWalletTransaction(
    WalletTransaction transactionToRemove,
  ) async {
    final Isar isar = db!;
    await isar
        .writeTxn(() => isar.walletTransactions.delete(transactionToRemove.id));
    wallets = await getWallets();
    notifyListeners();
  }

///////////////////////////////////////////////////////////////////////////////////////
//                                  TODOLISTS

  void updateDailyTasksRoutine() async {
    debugPrint('Routine started: Daily Tasks Update');
    for (var todoList in toDoLists) {
      for (var toDoTask in todoList.tasks) {
        if (toDoTask.isDaily && toDoTask.completionDate != null) {
          try {
            if (calculateDifference(toDoTask.completionDate!) < 0) {
              toDoTask.complete = false;
              await insertToDoTask(
                toDoTask,
                notify: false,
              );
            }
          } catch (e) {
            debugPrint('Routine error: Daily Tasks Update');
          }
        }
      }
    }
    notifyListeners();
    debugPrint('Routine finished: Daily Tasks Update');
  }

  // A method that retrieves all the wallets from the wallets table.
  Future<List<ToDoList>> getToDoLists() async {
    final Isar isar = db!;
    return await isar.toDoLists.where().findAll();
  }

  Future<void> insertToDoList(ToDoList toDoList) async {
    final Isar isar = db!;
    await isar.writeTxn(() => isar.toDoLists.put(toDoList));
    toDoLists = await getToDoLists();
    notifyListeners();
  }

  Future<void> insertToDoTask(
    ToDoTask toDoTask, {
    bool notify = true,
  }) async {
    final Isar isar = db!;

    await isar.writeTxn(() async {
      // Update the completionDate if the task is complete
      if (toDoTask.isDaily && toDoTask.complete) {
        toDoTask.completionDate = DateTime.now();
      } else if (toDoTask.completionDate != null) {
        toDoTask.completionDate = null;
      }

      // Add the toDoTask and set its ID
      toDoTask.id = await isar.toDoTasks.put(toDoTask);

      // Fetch the related toDoList
      final toDoList = await isar.toDoLists
          .where()
          .idEqualTo(toDoTask.toDoListId)
          .findFirst();

      if (toDoList != null) {
        // Add the toDoTask to the tasksLink of the retrieved toDoList
        toDoList.tasksLink.add(toDoTask);

        // Save the updated tasksLink
        await toDoList.tasksLink.save();
      }
    });
    toDoLists = await getToDoLists();
    if (notify) notifyListeners();
  }

  Future<void> deleteToDoList(ToDoList toDoList) async {
    final Isar isar = db!;
    await isar.writeTxn(() => isar.toDoLists.delete(toDoList.id));
    toDoLists = await getToDoLists();
    notifyListeners();
  }

  Future<void> deleteToDoTask(ToDoTask toDoTask) async {
    final Isar isar = db!;
    await isar.writeTxn(() => isar.toDoTasks.delete(toDoTask.id));
    toDoLists = await getToDoLists();
    notifyListeners();
  }

  Future<void> reorderToDoTask(
    int oldIndex,
    int newIndex,
    ToDoList toDoList,
  ) async {
    debugPrint('New index: $newIndex');
    debugPrint('Old index: $oldIndex');
    final Isar isar = db!;

    final list =
        await isar.toDoLists.where().idEqualTo(toDoList.id).findFirst();

    if (list != null) {
      await list.tasksLink.load();
      final tasks = list.tasks;

      // Reorder the task in memory
      tasks.insert(newIndex, tasks.removeAt(oldIndex));

      int start = (oldIndex < newIndex) ? oldIndex : newIndex;
      int end = (oldIndex > newIndex) ? oldIndex : newIndex;

      await isar.writeTxn(() async {
        for (int i = start; i <= end; i++) {
          tasks[i].parentIndex = i;
          await isar.toDoTasks.put(tasks[i]);
        }
      });

      toDoLists = await getToDoLists();
      notifyListeners();
    }
  }

  // OTHER

  int calculateDifference(DateTime date) {
    DateTime now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }
}
