import 'package:test/models/note_model.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

final List<NoteItem> notes = [
  NoteItem(
    title: 'about life',
    text: loremIpsum(words: 100),
    date: DateTime.now(),
  ),
  NoteItem(
    title: 'programming',
    text: loremIpsum(words: 60),
    date: DateTime.now(),
  ),
  NoteItem(
    title: 'bla',
    text: loremIpsum(words: 100),
    date: DateTime.now(),
  ),
];
