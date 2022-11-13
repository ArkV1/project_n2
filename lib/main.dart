import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.orange,
        ),
        fontFamily: 'Quicksand',
        // textTheme: ThemeData.light().textTheme.copyWith(

        //       titleLarge: TextStyle(
        //         fontFamily: 'OpenSans',
        //         fontWeight: FontWeight.bold,
        //         fontSize: 18,
        //       ),
        //     ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      // theme: ThemeData(
      //   colorScheme: theme.colorScheme.copyWith(
      //     primary: Colors.purple,
      //     secondary: Colors.orange,
      //   ),
      //   fontFamily: 'Quicksand',
      //   textTheme: ThemeData.light().textTheme.copyWith(
      //         titleLarge: TextStyle(
      //           fontFamily: 'OpenSans',
      //           fontWeight: FontWeight.bold,
      //           fontSize: 18,
      //         ),
      //       ),
      //   appBarTheme: AppBarTheme(
      //     titleTextStyle: TextStyle(
      //         fontFamily: 'OpenSans',
      //         fontSize: 20,
      //         fontWeight: FontWeight.bold),
      //   ),
      // ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // String? titleInput;

  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly Groceries',
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransactions, _deleteTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
