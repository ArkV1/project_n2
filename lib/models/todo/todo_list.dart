import 'dart:convert';

import 'package:project_n2/models/todo/todo_task.dart';

class ToDoList {
  String? id;

  final String name;
  //final String defaultCurrency;
  final List<ToDoTask> tasks;

  ToDoList({
    required this.id,
    required this.name,
    required this.tasks,
    //this.defaultCurrency, [
    //this.transactions,
    //]
  });

  factory ToDoList.fromMap(
    Map<String, dynamic> data,
  ) {
    return ToDoList(
      id: data['id'],
      name: data['name'],
      tasks: List<ToDoTask>.from(
        jsonDecode(data['tasksJSON']).map((x) => ToDoTask.fromMap(x)),
      ),
    );
  }

  // factory ToDoList.fromText(
  //   String encodedString,
  // ) {
  //   final valueMap = json.decode(encodedString);
  //   return ToDoList.fromMap(valueMap);
  // }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'tasksJSON': jsonEncode(List<dynamic>.from(tasks.map((x) => x.toMap()))),
    };
  }

  // String toText() {
  //   final valueMap = toMap();
  //   return jsonEncode(valueMap);
  // }
}
