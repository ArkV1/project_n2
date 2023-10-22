import 'package:isar/isar.dart';
import 'package:project_n2/models/todo/todo_list.dart';

part 'todo_task.g.dart';

@collection
class ToDoTask {
  Id id = Isar.autoIncrement; // Isar uses integer IDs by default

  int toDoListId; // Reference to the parent ToDoList
  int parentIndex;

  String? task;
  String? description;

  bool isDaily = false;
  bool complete = false;

  DateTime? creationDate;
  DateTime? completionDate;

  @Backlink(to: "tasksLink")
  final toDoLists = IsarLinks<ToDoList>();

  ToDoTask({
    required this.toDoListId,
    required this.parentIndex,
    this.task,
    this.description,
    this.isDaily = false,
    this.complete = false,
    this.creationDate,
    this.completionDate,
  }) {
    creationDate ??= DateTime.now();
  }

  // Convert the object from a map
  factory ToDoTask.fromMap(Map<String, dynamic> data) {
    return ToDoTask(
      toDoListId: data['todoListId'],
      parentIndex: data['parentIndex'],
      task: data['task'],
      description: data['description'],
      isDaily: data['isDaily'],
      complete: data['complete'],
      creationDate: data['creationDate'],
      completionDate: data['completionDate'],
    );
  }

  // Convert the object to a map
  Map<String, dynamic> toMap() {
    return {
      'todoListId': toDoListId,
      'parentIndex': parentIndex,
      if (task != null) 'task': task,
      if (description != null) 'description': description,
      if (isDaily != false) 'isDaily': isDaily,
      if (complete != true) 'complete': complete,
      if (creationDate != null) 'creationDate': creationDate,
      if (completionDate != null) 'completionDate': completionDate,
    };
  }
}
