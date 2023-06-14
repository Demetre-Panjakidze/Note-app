import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/providers/notes_provider.dart';
import 'package:test/widgets/single_note.dart';

class NotesList extends ConsumerWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesList = ref.watch(notesProvider);

    Widget defaultScreen = const Center(
      child: Text('No notes added yet!'),
    );

    if (notesList.isEmpty) defaultScreen;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: notesList.length,
        itemBuilder: ((ctx, index) {
          return SingleNote(
            singleNote: notesList[index],
          );
        }),
      ),
    );
  }
}
