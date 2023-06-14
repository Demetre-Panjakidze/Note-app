import 'package:riverpod/riverpod.dart';
import 'package:test/models/note_model.dart';

class NotesNotifier extends StateNotifier<List<NoteItem>> {
  NotesNotifier() : super([]);

  void stateUpdater(NoteItem noteItem) {
    state = [noteItem, ...state];
  }
}

final notesProvider = StateNotifierProvider<NotesNotifier, List<NoteItem>>(
  (_) {
    return NotesNotifier();
  },
);
