import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test/models/note_model.dart';

class OpenedNoteScreen extends StatelessWidget {
  const OpenedNoteScreen({super.key, required this.singleNote});

  final NoteItem singleNote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(singleNote.title)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DateFormat('yyyy-MM-dd').format(singleNote.date)),
            const SizedBox(height: 10),
            Text(singleNote.text),
          ],
        ),
      ),
    );
  }
}
