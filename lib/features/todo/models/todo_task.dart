import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

import 'package:project_n2/features/todo/models/todo_list.dart';

part 'todo_task.freezed.dart';

@freezed
class ToDoTask with _$ToDoTask {
  ToDoTask._();

  @Entity(realClass: ToDoTask)
  factory ToDoTask({
    @Id(assignable: true) @Default(0) int? id,
    required int toDoListId,
    required int parentIndex,
    String? task,
    String? description,
    @Default(false) bool isDaily,
    @Default(false) bool complete,
    @Property(type: PropertyType.date) DateTime? creationDate,
    @Property(type: PropertyType.date) DateTime? completionDate,
    @Transient() Uint8List? media,
    required ToOne<ToDoList> toDoListRelation,
  }) = _ToDoTask;

  ToDoList? get toDoList => toDoListRelation.target;
}
