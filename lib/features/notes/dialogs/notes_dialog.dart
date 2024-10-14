import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/features/notes/models/note.dart';

class NotesDialog extends ConsumerStatefulWidget {
  const NotesDialog({Key? key}) : super(key: key);

  @override
  ConsumerState<NotesDialog> createState() => _NotesDialogState();
}

class _NotesDialogState extends ConsumerState<NotesDialog> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Note'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: contentController,
            decoration: const InputDecoration(labelText: 'Content'),
            maxLines: 5,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            ref.read(notesProvider.notifier).addNote(
                  Note(
                    title: titleController.text,
                    content: contentController.text,
                    createdAt: DateTime.now(),
                  ),
                );
            Navigator.pop(context);
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
