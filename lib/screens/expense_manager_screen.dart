// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_n2/widgets/wallet_list_tile.dart';

import 'package:provider/provider.dart';

import '../models/expense_manager/wallet.dart';

import '../widgets/add_wallet_dialog.dart';

final _scaffoldKey = GlobalKey<ScaffoldState>();

class ExpenseManagerScreen extends StatefulWidget {
  const ExpenseManagerScreen({super.key});

  @override
  State<ExpenseManagerScreen> createState() => _ExpenseManagerScreenState();
}

class _ExpenseManagerScreenState extends State<ExpenseManagerScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<FirebaseFirestore>(context);

    CollectionReference walletsRef =
        db.collection('testing_wallet').withConverter<Wallet>(
              fromFirestore: (snapshots, _) =>
                  Wallet.fromFirestore(snapshots.data()!),
              toFirestore: (quiz, _) => quiz.toFirestore(),
            );

    //List<Wallet> wallets = [];

    void printWallets() {}

    // Wallet w1 = Wallet('Default wallet', '\$');
    // Wallet w2 = Wallet('Wallet 2', 'Bitcoin');

    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Column(
          children: [
            Text('Expense Manager'),
            Divider(),
            //////////////////////////////////////////////////////////////////////////
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text('Charts'),
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                        height: 140,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 0.5, color: Colors.black)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Weekly'),
                            Text('Chart 1'),
                          ],
                        ))),
                Expanded(
                    child: Container(
                        height: 140,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 0.5, color: Colors.black)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Monthly'),
                            Text('Chart 2'),
                          ],
                        ))),
                Expanded(
                    child: Container(
                        height: 140,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 0.5, color: Colors.black)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Total'),
                            Text('Chart 3'),
                          ],
                        )))
              ],
            ),
            Container(
                height: 120,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Colors.black)),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Expenses Categorized'),
                    //Text('Chart 4'),
                  ],
                )),
            //////////////////////////////////////////////////////////////////////////
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('Wallets'),
                  ),
                  StreamBuilder(
                    stream: walletsRef.snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error');
                      }

                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return Center(
                            child: Text('Not connected to the Stream or null'),
                          );

                        case ConnectionState.waiting:
                          return Center(
                            child: Text('Loading..'),
                          );

                        case ConnectionState.active:
                          print('Stream has started but not finished');

                          var totalWalletsCount = 0;
                          List<DocumentSnapshot> wallets;

                          if (snapshot.hasData) {
                            wallets = snapshot.data!.docs;
                            totalWalletsCount = wallets.length;

                            if (totalWalletsCount > 0) {
                              return Expanded(
                                child: ListView.builder(
                                  itemCount: totalWalletsCount,
                                  itemBuilder: ((context, index) {
                                    final w = wallets[index].data()! as Wallet;
                                    //q.id = quizzes[index].id;
                                    return Provider.value(
                                      value: w,
                                      child: WalletListTile(),
                                    );
                                  }),
                                ),
                              );
                            }
                          }
                          return Center(
                            child: Text('No wallets yet! Go create one!'),
                          );
                        case ConnectionState.done:
                          return Center(
                            child: Text('Streaming is done'),
                          );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.wallet),
              title: Text('Add wallet'),
              onTap: () => {
                
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.menu),
        onPressed: () {
          _scaffoldKey.currentState!.openEndDrawer();
          //if (_formKey.currentState!.validate()) {

          // Wallet newWallet = Wallet('Wallet', 'USD');
          // setState(() {
          //   walletsRef.add(newWallet);
          // });

          // showDialog(
          //   context: context,
          //   builder: (BuildContext context) {

          //     //return Provider.value(value: newWallet, child: AddWallet());

          //   },
          // );
          //}
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
