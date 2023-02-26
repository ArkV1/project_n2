// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../screens/expense_manager_screen.dart';
import '../screens/calendar_screen.dart';
import '../screens/notebook_screen.dart';

class SmartTile extends StatefulWidget {
  final String tileType;
  const SmartTile(this.tileType, {super.key});

  @override
  State<SmartTile> createState() => _SmartTileState();
}

class _SmartTileState extends State<SmartTile> {
  void pageNavigation(BuildContext ctx, screen) async {
    await Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return screen;
        },
      ),
    ).then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.tileType) {
      case 'Expense Manager':
        return InkWell(
          child: Container(
            decoration: BoxDecoration(border: Border.all(width: 1)),
            margin: EdgeInsets.all(2),
            child: Column(
              children: [
                Text('Expense manager tile'),
                Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            'Todays Expenses:\n125\$',
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: CircleBorder()),
                              onPressed: () {},
                              child: Icon(Icons.add)),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: CircleBorder()),
                        onPressed: () {},
                        child: Icon(Icons.menu)),
                  ],
                ),
              ],
            ),
          ),
          onTap: () {
            pageNavigation(context, ExpenseManagerScreen());
          },
        );
      case 'Calendar':
        return InkWell(
          child: Container(
            decoration: BoxDecoration(border: Border.all(width: 1)),
            margin: EdgeInsets.all(2),
            child: Column(
              children: [
                Text('Calendar tile'),
                Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            'Todays Events:\nEvent 1\nEvent 2',
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: CircleBorder()),
                        onPressed: () {},
                        child: Icon(Icons.menu)),
                  ],
                )
              ],
            ),
          ),
          onTap: () {
            pageNavigation(context, CalendarScreen());
          },
        );
      case 'Notebook':
        return InkWell(
          child: Container(
            decoration: BoxDecoration(border: Border.all(width: 1)),
            margin: EdgeInsets.all(2),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Notebook tile'),
                Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            'Example Note',
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: CircleBorder()),
                        onPressed: () {},
                        child: Icon(Icons.menu)),
                  ],
                )
              ],
            ),
          ),
          onTap: () {
            pageNavigation(context, NotebookScreen());
          },
        );
    }
    return Text('Tile Not Found...');
  }
}
