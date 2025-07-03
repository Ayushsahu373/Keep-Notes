import 'package:flutter/material.dart';

class NotesProvider extends ChangeNotifier {
  final List<String> _notes = [];

  List<String> get notes => _notes;

  void addNote(String note) {
    _notes.add(note);
    notifyListeners();
  }

  void updateNoteAt(int index, String newNote) {
    _notes[index] = newNote;
    notifyListeners();
  }

  void removeNoteAt(int index) {
    _notes.removeAt(index);
    notifyListeners();
  }
}
