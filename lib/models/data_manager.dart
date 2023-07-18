import 'package:flutter/material.dart';
import 'package:project_n2/models/wallet/wallet_widget.dart';
import 'package:project_n2/tools/enums/widget_types.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:project_n2/models/app_widget.dart';
import 'package:project_n2/models/wallet/wallet.dart';

Wallet defaultWallet = Wallet(id: 'defaultWallet', name: 'Default');

WalletWidget defaultWalletWidget = WalletWidget(
  id: 'defaultWallet',
  walletId: defaultWallet.id!,
  widgetType: WalletWidgetType.total,
);

class DataManager extends ChangeNotifier {
  Database? db;
  List<AppWidget> appWidgets = [];
  List<Wallet> wallets = [];

  DataManager() {
    init();
  }

  init() async {
    db = await openDatabase(
      'projectN2.db',
      onCreate: (db, version) async {
        Batch batch = db.batch();
        batch.execute(
            'CREATE TABLE appWidgets(id TEXT PRIMARY KEY, objectId TEXT, widgetType INTEGER)');
        batch.execute(
            //'CREATE TABLE wallets(id TEXT PRIMARY KEY, name TEXT, transactionsJSON TEXT)');
            'CREATE TABLE wallets(id TEXT PRIMARY KEY, name TEXT)');
        batch.execute(
            'CREATE TABLE transactions(id TEXT PRIMARY KEY, walletId TEXT, name TEXT, amount TEXT)');
        batch.insert('wallets', defaultWallet.toMap());
        batch.insert('appWidgets', defaultWalletWidget.toMap());
        await batch.commit(noResult: true);
        // Run the CREATE TABLE statement on the database.
        // db
        //     .execute(
        //       'CREATE TABLE appWidgets(id TEXT PRIMARY KEY, name TEXT)',
        //     )
        //     .then((value) => db.insert('wallets', defaultWallet.toMap()));
        // return db
        //     .execute(
        //       'CREATE TABLE wallets(id TEXT PRIMARY KEY, name TEXT)',
        //     )
        //     .then((value) => db.insert('wallets', defaultWallet.toMap()));
      },
      version: 1,
    );
    wallets = await getWallets();
    appWidgets = await getAppWidgets();
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
      return AppWidget.fromMap(maps[i]);
    });
  }

  Future<void> insertAppWidget(AppWidget appWidget) async {
    // Insert the Wallet into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same dog is inserted
    // multiple times, it replaces the previous data.

    await db!.insert(
      'appWidgets',
      appWidget.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    appWidgets = await getAppWidgets();
    notifyListeners();
  }

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
}
