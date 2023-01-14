// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpenseManagerTile extends StatefulWidget {
  const ExpenseManagerTile({super.key});

  @override
  State<ExpenseManagerTile> createState() => _ExpenseManagerTileState();
}

class _ExpenseManagerTileState extends State<ExpenseManagerTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      margin: EdgeInsets.all(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Expense manager tile')
        ],
      ),
    );
  }
}
