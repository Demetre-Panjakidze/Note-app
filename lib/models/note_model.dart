import 'package:uuid/uuid.dart';

class NoteItem {
  NoteItem({required this.text, required this.title, required this.date})
      : id = const Uuid().v4();
  final String title;
  final String text;
  final String id;
  final DateTime date;
}
