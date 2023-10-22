import 'package:isar/isar.dart';
import 'package:project_n2/models/todo/todo_task.dart';

part 'todo_list.g.dart';

@collection
class ToDoList {
  Id id = Isar.autoIncrement; // Isar uses integer IDs by default

  late final String name;

  // To store a list of objects in Isar, we use a link.
  // This requires setting up a relation between ToDoList and ToDoTask in the ToDoTask model.
  final tasksLink = IsarLinks<ToDoTask>();

  @ignore
  List<ToDoTask> get tasks {
    final sortedTasks = tasksLink.toList();
    sortedTasks.sort((a, b) => a.parentIndex.compareTo(b.parentIndex));
    return sortedTasks;
  }

  // Constructor
  ToDoList({
    required this.name,
  });

  // Convert the object to a map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      // Tasks will need to be handled separately due to the link.
    };
  }

  // Convert the object from a map
  factory ToDoList.fromMap(Map<String, dynamic> data) {
    return ToDoList(
      name: data['name'],
      // Tasks will need to be handled separately due to the link.
    );
  }
}
