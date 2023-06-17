import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/cubit/notes_cubit.dart';
import 'package:test/screens/opened_note.dart';

import '../models/note_model.dart';

class SingleNote extends StatelessWidget {
  const SingleNote({super.key, required this.singleNote});

  final NoteItem singleNote;

  @override
  Widget build(BuildContext context) {
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
        onDismissed: (direction) {
          context.read<NotesCubit>().stateRemove(singleNote);
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Note removed'),
            duration: Duration(seconds: 1),
          ));
        },
        background: Container(
          color: Colors.red,
        ),
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
    );
  }
}
