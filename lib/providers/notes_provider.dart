import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/models/note_model.dart';

class NotesNotifier extends StateNotifier<List<NoteItem>> {
  NotesNotifier() : super([]);

  void stateAdd(NoteItem noteItem) {
    state = [noteItem, ...state];
  }

  void stateRemove(NoteItem noteItem) {
    state.remove(noteItem);
  }
}

final notesProvider = StateNotifierProvider<NotesNotifier, List<NoteItem>>(
  (_) {
    return NotesNotifier();
  },
);
