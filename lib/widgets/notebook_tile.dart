// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotebookTile extends StatefulWidget {
  const NotebookTile({super.key});

  @override
  State<NotebookTile> createState() => _NotebookTileState();
}

class _NotebookTileState extends State<NotebookTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      margin: EdgeInsets.all(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Notebook tile')
        ],
      ),
    );
  }
}
