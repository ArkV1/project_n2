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
  TextEditingController ToDoTaskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final toDoLists = ref.read(dataManagerProvider).toDoLists;
    return AlertDialog(
      title: const Text('New to do task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Text('ToDoTask name'),
          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Order groceries',
            ),
            controller: ToDoTaskController,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ElevatedButton(
              onPressed: () {
                final currentList = toDoLists[ref.read(screenIndexProvider)];
                ref.read(dataManagerProvider).insertToDoTaskByListID(
                      ToDoTask(
                        id: currentList.tasks.length.toString(),
                        task: ToDoTaskController.text,
                        toDoListId: currentList.id!,
                      ),
                      currentList.id!,
                    );
              },
              child: const Text('Add'),
            ),
          ),
        ],
      ),
    );
  }
}
