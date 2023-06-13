import 'package:flutter/material.dart';
import 'package:test/data/note_data.dart';
import 'package:test/widgets/single_note.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    Widget defaultScreen = const Center(
      child: Text('No notes added yet!'),
    );

    if (notes.isEmpty) defaultScreen;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: notes.length,
        itemBuilder: ((ctx, index) {
          return SingleNote(
            singleNote: notes[index],
          );
        }),
      ),
    );
  }
}
