import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/cubit/notes_cubit.dart';
import 'package:test/models/note_model.dart';
import 'package:test/widgets/single_note.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    Widget defaultScreen = const Center(
      child: Text('No notes added yet!'),
    );

    return BlocBuilder<NotesCubit, List<NoteItem>>(builder: (ctx, state) {
      if (state.isEmpty) return defaultScreen;
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: state.length,
          itemBuilder: ((ctx, index) {
            return SingleNote(
              singleNote: state[index],
            );
          }),
          separatorBuilder: (ctx, index) {
            return const SizedBox(height: 10);
          },
        ),
      );
    });
  }
}
