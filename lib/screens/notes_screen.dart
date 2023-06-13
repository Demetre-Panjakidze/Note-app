import 'package:flutter/material.dart';
import 'package:test/screens/note_form.dart';
import 'package:test/widgets/notes_list.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: const NotesList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => const NoteFormScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
