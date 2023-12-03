import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:project_n2/models/data_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:project_n2/models/todo/todo_task.dart';

part 'todo_list.freezed.dart';
part 'todo_list.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class ToDoList with _$ToDoList {
  ToDoList._();
  factory ToDoList({
    @ignore @Default(Isar.autoIncrement) Id id,
    required String name,
  }) = _ToDoList;

  @override
  // ignore: recursive_getters
  Id get id => id;

  factory ToDoList.fromJson(Map<String, Object?> json) =>
      _$ToDoListFromJson(json);

  @ignore
  List<ToDoTask> get tasks {
    final sortedTasks = tasksLink.toList();
    sortedTasks.sort((a, b) => a.parentIndex.compareTo(b.parentIndex));
    return sortedTasks;
  }

  final tasksLink = IsarLinks<ToDoTask>();
}

@riverpod
class ToDoLists extends _$ToDoLists {
  @override
  FutureOr<List<ToDoList>> build() {
    return getToDoLists();
  }

  // A method that retrieves all the wallets from the wallets table.
  Future<List<ToDoList>> getToDoLists() async {
    return await ref
        .read(databaseProvider.future)
        .then((isar) => isar.toDoLists.where().findAll());
  }

  Future<void> updateToDoLists() async {
    state = AsyncData(await getToDoLists());
  }

  Future<void> insertToDoList(ToDoList toDoList) async {
    await ref.read(databaseProvider.future).then((isar) async {
      await isar.writeTxn(() => isar.toDoLists.put(toDoList));
      await updateToDoLists();
    });
  }

  Future<void> insertToDoTask(ToDoTask toDoTask) async {
    ref.read(databaseProvider.future).then((isar) async {
      if (toDoTask.isDaily && toDoTask.complete) {
        toDoTask = toDoTask.copyWith(
          completionDate: DateTime.now(),
        );
      } else if (toDoTask.completionDate != null) {
        toDoTask = toDoTask.copyWith(
          completionDate: null,
        );
      }
      await isar.writeTxn(
        () async {
          ToDoTask addedTask = await isar.toDoTasks.put(toDoTask).then(
                (id) => toDoTask.copyWith(id: id),
              );
          // toDoTask.toDoLists.load();
          // final toDoList = toDoTask.toDoLists.first;

          final toDoList = await isar.toDoLists.get(toDoTask.toDoListId);
          if (toDoList != null) {
            toDoList.tasksLink.add(addedTask);
            await toDoList.tasksLink.save();
          } else {
            debugPrint('Error while inserting\nToDoList not found');
          }
        },
      );
      await updateToDoLists();
    });
  }

  Future<void> deleteToDoList(ToDoList toDoList) async {
    debugPrint('Deleting toDoList: ${toDoList.id}');
    return ref.read(databaseProvider.future).then((isar) async {
      await isar.writeTxn(() => isar.toDoLists.delete(toDoList.id));
      await updateToDoLists();
    });
  }

  Future<void> deleteToDoTask(ToDoTask toDoTask) async {
    return ref.read(databaseProvider.future).then((isar) async {
      final toDoList = await isar.toDoLists.get(toDoTask.toDoListId);
      await isar.writeTxn(() async {
        isar.toDoTasks.delete(toDoTask.id);
        toDoList!.tasksLink.remove(toDoTask);
        await toDoList.tasksLink.save();
      });
      await updateToDoLists();
    });
  }

  Future<void> reorderToDoTask(
    int oldIndex,
    int newIndex,
    List<ToDoTask> tasks,
    bool notify,
  ) async {
    ref.read(databaseProvider.future).then(
      (isar) async {
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

        await isar.writeTxn(() async {
          for (int i = start; i <= end; i++) {
            await isar.toDoTasks.put(tasks[i]);
          }
        });
        await updateToDoLists();
      },
    );
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
    ref.read(databaseProvider.future).then((isar) {
      debugPrint('Routine status: Database ready');
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
    });
  }
}
