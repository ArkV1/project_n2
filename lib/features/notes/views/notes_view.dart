import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/features/notes/models/note.dart';

class NotesView extends ConsumerWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesProvider);

    return notes.when(
      data: (notesList) {
        return ListView.builder(
          itemCount: notesList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(notesList[index].title),
              subtitle: Text(notesList[index].content),
              onTap: () {
                // Open note for editing
              },
            );
          },
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
    );
  }
}
