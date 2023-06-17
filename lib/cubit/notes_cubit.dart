import 'package:bloc/bloc.dart';
import 'package:test/models/note_model.dart';

class NotesCubit extends Cubit<List<NoteItem>> {
  NotesCubit() : super([]);

  void stateAdd(NoteItem noteItem) {
    emit([noteItem, ...state]);
  }

  void stateRemove(NoteItem noteItem) {
    emit(state.where((note) => note != noteItem).toList());
  }
}
