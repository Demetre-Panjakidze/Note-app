import 'package:flutter/material.dart';
import 'package:test/screens/opened_note.dart';

import '../models/note_model.dart';

class SingleNote extends StatelessWidget {
  const SingleNote({super.key, required this.singleNote});

  final NoteItem singleNote;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OpenedNoteScreen(singleNote: singleNote),
            ),
          );
        },
        child: ListTile(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(5),
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5),
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
    );
  }
}
