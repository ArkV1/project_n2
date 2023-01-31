import 'package:flutter/material.dart';

class SmartTile extends StatefulWidget {
  final String tileType;
  const SmartTile(this.tileType, {super.key});

  @override
  State<SmartTile> createState() => _SmartTileState();
}

class _SmartTileState extends State<SmartTile> {
  @override
  Widget build(BuildContext context) {
    switch (widget.tileType) {
      case 'Expense Manager':
        return Container(
          decoration: BoxDecoration(border: Border.all(width: 1)),
          margin: EdgeInsets.all(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [Text('Expense manager tile')],
          ),
        );
      case 'Calendar':
        return Container(
          decoration: BoxDecoration(border: Border.all(width: 1)),
          margin: EdgeInsets.all(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [Text('Calendar tile')],
          ),
        );
      case 'Notebook':
        return Container(
          decoration: BoxDecoration(border: Border.all(width: 1)),
          margin: EdgeInsets.all(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [Text('Notebook tile')],
          ),
        );
    }
    return Text('Tile Not Found...');
  }
}
