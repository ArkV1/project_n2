import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_n2/models/todo/todo_list.dart';
import 'package:project_n2/models/todo/todo_widget.dart';
import 'package:project_n2/models/wallet/wallet_transaction.dart';
import 'package:project_n2/models/wallet/wallet_widget.dart';
import 'package:project_n2/tools/enums/widget_types.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:project_n2/models/todo/todo_task.dart';

import 'package:project_n2/models/app_widget.dart';
import 'package:project_n2/models/wallet/wallet.dart';

class DataManager extends ChangeNotifier {
  Database? db;
  List<AppWidget> appWidgets = [];
  List<ToDoList> toDoLists = [];
  List<Wallet> wallets = [];

  DataManager() {
    init();
  }

  init() async {
    // TO DO
    ToDoList defaultToDoList = ToDoList(
      id: 'defaultToDoList',
      name: 'DefaultToDoList',
      tasks: [],
    );
    ToDoTask exampleTask = ToDoTask(
      id: 'exampleTask',
      toDoListId: defaultToDoList.id ?? 'defaultToDoList',
      task: 'task',
    );
    defaultToDoList.tasks.add(exampleTask);
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
    //
    //  WIDGETS
    //
    // WalletWidget defaultWalletWidget = WalletWidget(
    //   id: 'defaultWallet',
    //   parentIndex: 0,
    //   parentId: 'mainScreen',
    //   walletId: defaultWallet.id!,
    //   widgetType: WalletWidgetType.total,
    // );
    // In testing
    ToDoWidget(
      id: 'defaultToDoList',
      parentIndex: 0,
      parentId: 'mainScreen',
      toDoListId: defaultToDoList.id!,
      widgetType: ToDoWidgetType.classic,
    );

    db = await openDatabase(
      'projectN2.db',
      onCreate: (db, version) async {
        Batch batch = db.batch();

        //
        batch.execute(
            'CREATE TABLE toDoLists(id TEXT PRIMARY KEY, name TEXT, tasksJSON TEXT)');
        batch.execute(
            'CREATE TABLE toDoTasks(id TEXT PRIMARY KEY, toDoListId TEXT, task TEXT, description TEXT, complete INTEGER, creationDate TEXT, completionDate TEXT)');
        batch.insert('toDoLists', defaultToDoList.toMap());
        batch.insert('toDoTasks', exampleTask.toMap());
        //
        // batch.execute(
        //     //'CREATE TABLE wallets(id TEXT PRIMARY KEY, name TEXT, transactionsJSON TEXT)');
        //     'CREATE TABLE wallets(id TEXT PRIMARY KEY, name TEXT)');
        // batch.execute(
        //     'CREATE TABLE transactions(id TEXT PRIMARY KEY, walletId TEXT, name TEXT, amount TEXT)');
        // batch.execute(
        //     'CREATE TABLE appWidgets(id TEXT PRIMARY KEY, parentId TEXT, parentIndex INTEGER, containedObjectId TEXT, containedObjectType TEXT, widgetType INTEGER)');
        // batch.insert('wallets', defaultWallet.toMap());
        // batch.insert('appWidgets', defaultWalletWidget.toMap());
        await batch.commit(noResult: true);
        // Run the CREATE TABLE statement on the database.
        // db
        //     .execute(
        //       'CREATE TABLE appWidgets(id TEXT PRIMARY KEY, name TEXT)',
        //     )
        //     .then((value) => db.insert('appWidgets', defaultWallet.toMap()));
        // return db
        //     .execute(
        //       'CREATE TABLE wallets(id TEXT PRIMARY KEY, name TEXT)',
        //     )
        //     .then((value) => db.insert('wallets', defaultWallet.toMap()));
      },
      version: 1,
    );
    toDoLists = await getToDoLists();
    // wallets = await getWallets();
    // appWidgets = await getAppWidgets();
    notifyListeners();
  }

///////////////////////////////////////////////////////////////////////////////////////
//                                APP WIDGETS

  // A method that retrieves all the wallets from the wallets table.
  Future<List<AppWidget>> getAppWidgets() async {
    // Query the table for all The Wallet.
    final List<Map<String, dynamic>> maps = await db!.query('appWidgets');

    // Convert the List<Map<String, dynamic> into a List<Wallet>.
    return List.generate(maps.length, (i) {
      return WalletWidget.fromMap(maps[i]);
    });
  }

  Future<void> insertAppWidget(AppWidget appWidget) async {
    // Insert the Wallet into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same dog is inserted
    // multiple times, it replaces the previous data.
    await db!.insert(
      'appWidgets',
      appWidget.toMap(),
      // conflictAlgorithm: ConflictAlgorithm.replace,
    );
    appWidgets = await getAppWidgets();
    notifyListeners();
  }

  Future<void> reorderInParentList(
    int oldIndex,
    int newIndex,
    List<AppWidget> parentWidgetsList,
  ) async {
    debugPrint('New index: ${newIndex.toString()}');
    debugPrint('Old index: ${oldIndex.toString()}');
    // parentWidgetsList.insert(newIndex, parentWidgetsList.removeAt(oldIndex));
    final batch = db!.batch();

    batch.update(
      'appWidgets',
      {
        'parentIndex': newIndex,
      },
      where: 'id = ?',
      whereArgs: [parentWidgetsList[oldIndex].id],
    );
    if (newIndex < oldIndex) {
      for (var i = newIndex; i < oldIndex; i++) {
        batch.update(
          'appWidgets',
          {
            'parentIndex': i + 1,
          },
          where: 'id = ?',
          whereArgs: [parentWidgetsList[i].id],
        );
      }
    } else {
      for (var i = newIndex; i > oldIndex; i--) {
        batch.update(
          'appWidgets',
          {
            'parentIndex': i - 1,
          },
          where: 'id = ?',
          whereArgs: [parentWidgetsList[i].id],
        );
      }
    }
    await batch.commit();
    appWidgets = await getAppWidgets();
    notifyListeners();
  }

  // Future<void> replaceAppWidget(
  //     AppWidget toReplace, AppWidget toBeReplaced) async {
  //   final String toReplaceIdHolder = toReplace.id;
  //   toReplace.id = toBeReplaced.id;
  //   toBeReplaced.id = toReplaceIdHolder;
  //   // Insert the Wallet into the correct table. Also specify the
  //   // `conflictAlgorithm`. In this case, if the same dog is inserted
  //   // multiple times, it replaces the previous data.
  //   // Batch batch = db!.batch();
  //   db!.insert('appWidgets', toReplace.toMap(),
  //       conflictAlgorithm: ConflictAlgorithm.replace);
  //   db!.insert('appWidgets', toBeReplaced.toMap(),
  //       conflictAlgorithm: ConflictAlgorithm.replace);
  //   // await batch.commit(noResult: true);
  //   // await db!.insert(
  //   //   'appWidgets',
  //   //   appWidget.toMap(),
  //   //   conflictAlgorithm: ConflictAlgorithm.replace,
  //   // );
  //   appWidgets = await getAppWidgets();
  //   notifyListeners();
  // }

  Future<void> deleteAppWidget(String id) async {
    // Remove the Wallet from the database.
    await db!.delete(
      'appWidgets',
      // Use a `where` clause to delete a specific wallet.
      where: 'id = ?',
      // Pass the Wallet's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
    appWidgets = await getAppWidgets();
    notifyListeners();
  }

///////////////////////////////////////////////////////////////////////////////////////
//                                  WALLETS

  // A method that retrieves all the wallets from the wallets table.
  Future<List<Wallet>> getWallets() async {
    // Query the table for all The Wallet.
    final List<Map<String, dynamic>> maps = await db!.query('wallets');

    // Convert the List<Map<String, dynamic> into a List<Wallet>.
    return List.generate(maps.length, (i) {
      return Wallet.fromMap(maps[i]);
    });
  }

  Future<void> insertWallet(Wallet wallet) async {
    // Insert the Wallet into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same dog is inserted
    // multiple times, it replaces the previous data.

    await db!.insert(
      'wallets',
      wallet.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    wallets = await getWallets();
    notifyListeners();
  }

  Future<void> deleteWallet(String id) async {
    // Remove the Wallet from the database.
    await db!.delete(
      'wallets',
      // Use a `where` clause to delete a specific wallet.
      where: 'id = ?',
      // Pass the Wallet's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
    wallets = await getWallets();
    notifyListeners();
  }

///////////////////////////////////////////////////////////////////////////////////////
//                                  TODOLISTS

  // A method that retrieves all the wallets from the wallets table.
  Future<List<ToDoList>> getToDoLists() async {
    // Query the table for all The Wallet.
    final List<Map<String, dynamic>> maps = await db!.query('toDoLists');

    // Convert the List<Map<String, dynamic> into a List<Wallet>.
    return List.generate(maps.length, (i) {
      return ToDoList.fromMap(maps[i]);
    });
  }

  Future<void> insertToDoList(ToDoList toDoList) async {
    // Insert the Wallet into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same dog is inserted
    // multiple times, it replaces the previous data.

    await db!.insert(
      'toDoLists',
      toDoList.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    toDoLists = await getToDoLists();
    notifyListeners();
  }

  Future<void> insertToDoTaskByListID(ToDoTask toDoTask, String id) async {
    // Insert the Wallet into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same dog is inserted
    // multiple times, it replaces the previous data.
    final currentList =
        toDoLists.singleWhere((thisToDoList) => thisToDoList.id == id);
    try {
      currentList.tasks[currentList.tasks
          .indexWhere((task) => task.id == toDoTask.id)] = toDoTask;
    } catch (e) {
      currentList.tasks.add(toDoTask);
    }
    await db!.update(
      'toDoLists',
      {
        'tasksJSON': jsonEncode(
            List<dynamic>.from(currentList.tasks.map((x) => x.toMap())))
      },
      where: 'id = ?',
      whereArgs: [id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    toDoLists = await getToDoLists();
    notifyListeners();
  }

  Future<void> deleteToDoList(String id) async {
    // Remove the Wallet from the database.
    await db!.delete(
      'toDoLists',
      // Use a `where` clause to delete a specific wallet.
      where: 'id = ?',
      // Pass the Wallet's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
    toDoLists = await getToDoLists();
    notifyListeners();
  }

  Future<void> deleteToDoTask(ToDoTask toDoTask, String id) async {
    // Remove the Wallet from the database.
    final currentList =
        toDoLists.singleWhere((thisToDoList) => thisToDoList.id == id);
    try {
      // currentList.tasks[currentList.tasks
      //     .indexWhere((task) => task.id == toDoTask.id)] = toDoTask;
      currentList.tasks.removeWhere((task) => task.id == toDoTask.id);
    } catch (e) {
      debugPrint('Wasnt able to remove task ID:${toDoTask.id}');
      // currentList.tasks.add(toDoTask);
    }
    await db!.update(
      'toDoLists',
      {
        'tasksJSON': jsonEncode(
            List<dynamic>.from(currentList.tasks.map((x) => x.toMap())))
      },
      where: 'id = ?',
      whereArgs: [id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    toDoLists = await getToDoLists();
    notifyListeners();
  }

  Future<void> reorderToDoTask(
    int oldIndex,
    int newIndex,
    String id,
  ) async {
    debugPrint('New index: ${newIndex.toString()}');
    debugPrint('Old index: ${oldIndex.toString()}');
    // parentWidgetsList.insert(newIndex, parentWidgetsList.removeAt(oldIndex));
    final currentList =
        toDoLists.singleWhere((thisToDoList) => thisToDoList.id == id);
    currentList.tasks.insert(newIndex, currentList.tasks.removeAt(oldIndex));
    await db!.update(
      'toDoLists',
      {
        'tasksJSON': jsonEncode(
            List<dynamic>.from(currentList.tasks.map((x) => x.toMap())))
      },
      where: 'id = ?',
      whereArgs: [id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    toDoLists = await getToDoLists();
    notifyListeners();
  }
}
