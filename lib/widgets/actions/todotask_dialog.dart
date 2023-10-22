import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/models/todo/todo_task.dart';
import 'package:project_n2/providers/providers.dart';

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
    final toDoLists = ref.read(dataManagerProvider).toDoLists;
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
                final currentList = toDoLists[ref.read(screenIndexProvider)];
                ref.read(dataManagerProvider).insertToDoTask(
                      ToDoTask(
                        toDoListId: currentList.id,
                        parentIndex: currentList.tasks.length,
                        //
                        task: toDoTaskController.text,
                        isDaily: daily,
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
  }
}
