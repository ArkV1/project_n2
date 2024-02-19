import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// ignore: unnecessary_import
import 'package:objectbox/objectbox.dart'; // Removal breaks objectbox's annotations

import 'package:project_n2/models/objectbox.dart';
import 'package:project_n2/models/todo/todo_task.dart';

import 'package:project_n2/objectbox.g.dart';

part 'todo_list.freezed.dart';
part 'todo_list.g.dart';

@freezed
class ToDoList with _$ToDoList {
  ToDoList._();

  @Entity(realClass: ToDoList)
  factory ToDoList({
    @Id(assignable: true) @Default(0) int? id,
    required String name,
    required ToMany<ToDoTask> tasksRelation,
  }) = _ToDoList;

  List<ToDoTask> get tasks => tasksRelation.toList()
    ..sort((a, b) => a.parentIndex.compareTo(b.parentIndex));
}

@riverpod
class ToDoLists extends _$ToDoLists {
  @override
  FutureOr<List<ToDoList>> build() {
    return getToDoLists();
  }

  // A method that retrieves all the wallets from the wallets table.
  Future<List<ToDoList>> getToDoLists() async {
    final toDoLists = db.box<ToDoList>();
    return toDoLists.getAll();
  }

  Future<void> updateToDoLists() async {
    state = AsyncData(await getToDoLists());
  }

  Future<void> insertToDoList(ToDoList toDoList) async {
    final toDoLists = db.box<ToDoList>();
    int? id = toDoList.id;
    // TODO Add cached id for improving speed and performance
    if (id == null || id == 0) {
      id = (toDoLists
                  .query()
                  .order(ToDoList_.id, flags: Order.descending)
                  .build()
                  .findFirst()
                  ?.id ??
              0) +
          1;
    }
    toDoLists.put(toDoList.copyWith(id: id));
    await updateToDoLists();
  }

  Future<void> insertToDoTask(ToDoTask toDoTask, {ToDoList? toDoList}) async {
    final toDoLists = db.box<ToDoList>();
    final toDoTasks = db.box<ToDoTask>();

    if (toDoTask.isDaily && toDoTask.complete) {
      toDoTask = toDoTask.copyWith(
        completionDate: DateTime.now(),
      );
    } else if (toDoTask.completionDate != null) {
      toDoTask = toDoTask.copyWith(
        completionDate: null,
      );
    }

    // TODO Add cached id for improving speed and performance
    int? id = toDoTask.id;
    if (id == null || id == 0) {
      id = (toDoTasks
                  .query()
                  .order(ToDoTask_.id, flags: Order.descending)
                  .build()
                  .findFirst()
                  ?.id ??
              0) +
          1;
    }
    ToDoTask addedTask =
        await toDoTasks.putAndGetAsync(toDoTask.copyWith(id: id));
    toDoList ??= toDoLists.get(toDoTask.toDoListId);
    if (toDoList != null) {
      toDoList.tasksRelation.add(addedTask);
      toDoLists.put(toDoList);
      // toDoList.tasksLink.add(addedTask);
      // await toDoList.tasksLink.save();
    } else {
      debugPrint('Error while inserting\nToDoList not found');
    }

    await updateToDoLists();
  }

  Future<void> deleteToDoList(ToDoList toDoList) async {
    debugPrint('Deleting toDoList: ${toDoList.id}');
    final toDoLists = db.box<ToDoList>();
    toDoLists.remove(toDoList.id!);
    await updateToDoLists();
  }

  Future<void> deleteToDoTask(ToDoTask toDoTask) async {
    final toDoLists = db.box<ToDoList>();
    final toDoTasks = db.box<ToDoTask>();
    final toDoList = await toDoLists.getAsync(toDoTask.toDoListId);
    toDoTasks.remove(toDoTask.id!);
    await updateToDoLists();
  }

  Future<void> reorderToDoTask(
    int oldIndex,
    int newIndex,
    List<ToDoTask> tasks,
  ) async {
    debugPrint('New index: $newIndex');
    debugPrint('Old index: $oldIndex');

    // Perform the in-memory reorder
    var movedTask = tasks.removeAt(oldIndex);
    tasks.insert(newIndex, movedTask);

    // Determine the range of affected indices
    int start = (oldIndex < newIndex) ? oldIndex : newIndex;
    int end = (oldIndex > newIndex) ? oldIndex : newIndex;

    // Update local state only for affected indices outside of the transaction
    for (int i = start; i <= end; i++) {
      tasks[i] = tasks[i].copyWith(parentIndex: i);
    }

    final toDoTasks = db.box<ToDoTask>();
    for (int i = start; i <= end; i++) {
      toDoTasks.put(tasks[i], mode: PutMode.update);
    }
    await updateToDoLists();
  }

  int calculateDifference(DateTime date) {
    DateTime now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }

  void updateDailyTasksRoutine() async {
    debugPrint('Routine started: Daily Tasks Update');
    debugPrint('Routine status: Awaiting Database');
    debugPrint('Routine status: Awaiting ToDoLists');
    ref.read(toDoListsProvider.future).then((toDoLists) async {
      debugPrint('Routine status: ToDoLists ready');
      for (var todoList in toDoLists) {
        for (var toDoTask in todoList.tasks) {
          if (toDoTask.isDaily && toDoTask.completionDate != null) {
            try {
              if (calculateDifference(toDoTask.completionDate!) < 0) {
                toDoTask = toDoTask.copyWith(complete: false);
                await insertToDoTask(toDoTask);
              }
            } catch (e) {
              debugPrint('Routine error: Daily Tasks Update');
            }
          }
        }
      }
      updateToDoLists();
      debugPrint('Routine finished: Daily Tasks Update');
    });
  }
}
