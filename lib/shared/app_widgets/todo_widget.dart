import 'package:flutter/material.dart';
import 'package:project_n2/models/todo/todo_list.dart';
import 'package:project_n2/models/widgets/todo_widget.dart';

class ToDoWidgetBuilder extends StatelessWidget {
  final ToDoWidget toDoWidget;
  final ToDoList toDoList;

  const ToDoWidgetBuilder({
    Key? key,
    required this.toDoWidget,
    required this.toDoList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(toDoList.name),
          ),
          const ListTile(
            title: Text('Title'),
            subtitle: Text('Subtitle'),
            visualDensity: VisualDensity.compact,
            dense: true,
          ),
        ],
      ),
    );
  }
}
