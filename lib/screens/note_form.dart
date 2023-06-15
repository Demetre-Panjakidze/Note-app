import 'package:flutter/material.dart';
import 'package:test/models/note_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/providers/notes_provider.dart';

class NoteFormScreen extends ConsumerStatefulWidget {
  const NoteFormScreen({super.key});

  @override
  ConsumerState<NoteFormScreen> createState() => _NoteFormScreenState();
}

class _NoteFormScreenState extends ConsumerState<NoteFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String _enteredText = '';
  String _enteredTitle = '';

  void saveForm() {
    _formKey.currentState!.save();

    ref.read(notesProvider.notifier).stateAdd(
          NoteItem(
              date: DateTime.now(), text: _enteredText, title: _enteredTitle),
        );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Note created'),
      duration: Duration(seconds: 1),
    ));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
        actions: [
          IconButton(
            onPressed: saveForm,
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Title..',
                  hintStyle: TextStyle(color: Colors.grey),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                ),
                maxLength: 50,
                onSaved: (value) {
                  _enteredTitle = value!;
                },
              ),
              const SizedBox(
                width: 32,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your note',
                      hintStyle: TextStyle(color: Colors.grey),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    onChanged: (value) {
                      _enteredText = value;
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
