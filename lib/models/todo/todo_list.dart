import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:project_n2/models/data_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:project_n2/models/todo/todo_task.dart';

part 'todo_list.freezed.dart';
part 'todo_list.g.dart';

@freezed
class ToDoList with _$ToDoList {
  ToDoList._();

  @Entity(realClass: ToDoList)
  factory ToDoList({
    @Id(assignable: true) @Default(0) int? id,
    required String name,
    required ToMany<ToDoTask> tasks,
  }) = _ToDoList;

  // List<ToDoTask> get tasks => tasksRelation;
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
    await toDoLists.putAsync(toDoList);
    await updateToDoLists();
  }

  Future<void> insertToDoTask(ToDoTask toDoTask) async {
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

    ToDoTask addedTask = await toDoTasks.putAsync(toDoTask).then(
          (id) => toDoTask.copyWith(id: id),
        );
    // toDoTask.toDoLists.load();
    // final toDoList = toDoTask.toDoLists.first;

    final toDoList = await toDoLists.get(toDoTask.toDoListId);
    if (toDoList != null) {
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
    bool notify,
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
      await toDoTasks.putAsync(tasks[i]);
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
    final toDoLists = db.box<ToDoList>();
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
