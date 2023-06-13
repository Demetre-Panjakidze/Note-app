import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/screens/notes_screen.dart';

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
      home: const NotesScreen(),
    );
  }
}
