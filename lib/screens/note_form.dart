import 'package:flutter/material.dart';
import 'package:test/data/note_data.dart';
import 'package:test/models/note_model.dart';

class NoteFormScreen extends StatefulWidget {
  const NoteFormScreen({super.key});

  @override
  State<NoteFormScreen> createState() => _NoteFormScreenState();
}

class _NoteFormScreenState extends State<NoteFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String _enteredText = '';
  String _enteredTitle = '';

  void saveForm() {
    _formKey.currentState!.save();
    setState(() {
      notes.add(
        NoteItem(
          text: _enteredText,
          title: _enteredTitle,
          date: DateTime.now(),
        ),
      );
    });

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
