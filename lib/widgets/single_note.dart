import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/providers/notes_provider.dart';
import 'package:test/screens/opened_note.dart';

import '../models/note_model.dart';

class SingleNote extends ConsumerWidget {
  const SingleNote({super.key, required this.singleNote});

  final NoteItem singleNote;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OpenedNoteScreen(singleNote: singleNote),
          ),
        );
      },
      child: Dismissible(
        key: Key(singleNote.id),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ListTile(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Colors.black),
              borderRadius: BorderRadius.circular(5),
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 8),
              child: Text(
                singleNote.title,
                style: Theme.of(context).copyWith().textTheme.titleLarge,
              ),
            ),
            subtitle: Text(
              singleNote.text,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: Theme.of(context).copyWith().textTheme.bodySmall,
            ),
          ),
        ),
        onDismissed: (direction) {
          ref.read(notesProvider.notifier).stateRemove(singleNote);
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Note removed'),
          ));
        },
        background: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
