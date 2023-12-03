import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:project_n2/models/todo/todo_list.dart';

part 'todo_task.freezed.dart';
part 'todo_task.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class ToDoTask with _$ToDoTask {
  ToDoTask._();
  factory ToDoTask({
    @ignore @Default(Isar.autoIncrement) Id id,
    required int toDoListId,
    required int parentIndex,
    String? task,
    String? description,
    @Default(false) bool isDaily,
    @Default(false) bool complete,
    DateTime? creationDate,
    DateTime? completionDate,
  }) = _ToDoTask;

  @override
  // ignore: recursive_getters
  Id get id => id;

  factory ToDoTask.fromJson(Map<String, Object?> json) =>
      _$ToDoTaskFromJson(json);

  @Backlink(to: "tasksLink")
  final toDoLists = IsarLinks<ToDoList>();
}
