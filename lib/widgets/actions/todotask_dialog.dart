import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/models/app_settings.dart';
import 'package:project_n2/models/todo/todo_list.dart';
import 'package:project_n2/models/todo/todo_task.dart';

class ToDoTaskDialog extends ConsumerStatefulWidget {
  const ToDoTaskDialog({super.key});

  @override
  ConsumerState<ToDoTaskDialog> createState() => _ToDoTaskDialogState();
}

class _ToDoTaskDialogState extends ConsumerState<ToDoTaskDialog> {
  TextEditingController toDoTaskController = TextEditingController();
  bool daily = false;

  @override
  Widget build(BuildContext context) {
    return ref.watch(toDoListsProvider).when(
      data: (toDoLists) {
        return AlertDialog(
          title: const Text(
            'New to do task',
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //Text('ToDoTask name'),
              TextField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Task summary",
                  hintText: 'Order groceries',
                ),
                controller: toDoTaskController,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Daily task\n(Resets every day)'),
                    Checkbox.adaptive(
                      value: daily,
                      onChanged: (value) {
                        setState(
                          () {
                            daily = value!;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    final currentList =
                        toDoLists[ref.read(screenIndexProvider)];
                    debugPrint(
                        'Adding a task to a list:\n${currentList.name},\nList ID: ${currentList.id}');
                    ref.read(toDoListsProvider.notifier).insertToDoTask(
                          ToDoTask(
                            toDoListId: currentList.id,
                            parentIndex: currentList.tasks.length,
                            //
                            task: toDoTaskController.text,
                            isDaily: daily,
                            creationDate: DateTime.now(),
                          ),
                        );
                    Navigator.pop(context);
                  },
                  child: const Text('Add'),
                ),
              ),
            ],
          ),
        );
      },
      error: (error, stacktrace) {
        return Center(
          child: Text(
            'Error loading To Do Lists\n $error',
            textAlign: TextAlign.center,
            textScaler: const TextScaler.linear(1.25),
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
