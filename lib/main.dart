import 'package:flutter/material.dart';
import 'package:test/screens/notes_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/cubit/notes_cubit.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      title: 'Flutter Notes app',
      home: BlocProvider(
        create: (context) => NotesCubit(),
        child: const NotesScreen(),
      ),
    );
  }
}
