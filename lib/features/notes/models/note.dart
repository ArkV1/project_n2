import 'package:project_n2/core/models/objectbox.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:objectbox/objectbox.dart';

part 'note.freezed.dart';
part 'note.g.dart';

@freezed
class Note with _$Note {
  @Entity(realClass: Note)
  factory Note({
    @Id(assignable: true) int? id,
    required String title,
    required String content,
    @Property(type: PropertyType.date) required DateTime createdAt,
  }) = _Note;

  Note._();
}

@Riverpod(keepAlive: true)
class Notes extends _$Notes {
  @override
  FutureOr<List<Note>> build() {
    return getNotes();
  }

  Future<List<Note>> getNotes() async {
    final notes = db.box<Note>();
    return notes.getAll();
  }

  Future<void> addNote(Note note) async {
    final notes = db.box<Note>();
    await notes.putAsync(note);
    state = AsyncValue.data([...state.value ?? [], note]);
  }

  Future<void> updateNote(Note note) async {
    final notes = db.box<Note>();
    await notes.putAsync(note);
    state = AsyncValue.data(
      (state.value ?? []).map((e) => e.id == note.id ? note : e).toList(),
    );
  }

  Future<void> deleteNote(Note note) async {
    final notes = db.box<Note>();
    await notes.removeAsync(note.id!);
    state = AsyncValue.data(
      (state.value ?? []).where((e) => e.id != note.id).toList(),
    );
  }
}
