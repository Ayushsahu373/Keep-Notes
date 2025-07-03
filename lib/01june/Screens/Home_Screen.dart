import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revision_app/01june/Widgets/Note_Container.dart';
import 'package:revision_app/01june/Widgets/Note_Editor.dart';
import 'package:revision_app/01june/provider/Notes_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController noteController = TextEditingController();
  bool isEditing = false;
  int? editingIndex;

  @override
  void initState() {
    super.initState();
  }

  void startCreatingNote() {
    isEditing = false;
    noteController.clear();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: noteEditor(
            controller: noteController,
            hintText: 'Create a note',
            isHidden: false,
            onSave: (note) {
              if (note.trim().isNotEmpty) {
                context.read<NotesProvider>().addNote(note);
              }
              Navigator.of(context).pop();
            },
            onCancel: () => Navigator.of(context).pop(),
          ),
        );
      },
    );
  }

  void startEditingNote(int index) {
    isEditing = true;
    editingIndex = index;
    noteController.text = context.read<NotesProvider>().notes[index];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: noteEditor(
            controller: noteController,
            hintText: 'Edit your note',
            isHidden: false,
            onSave: (note) {
              if (note.trim().isNotEmpty) {
                context.read<NotesProvider>().updateNoteAt(index, note);
              }
              Navigator.of(context).pop();
            },
            onCancel: () => Navigator.of(context).pop(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final notes = context.watch<NotesProvider>().notes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keep Notes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: startCreatingNote,
          ),
        ],
      ),
      body: notes.isEmpty
          ? const Center(child: Text('No notes yet.'))
          : ListView.builder(
              padding: const EdgeInsets.only(bottom: 100),
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => startEditingNote(index),
                  child: notesContainer(
                    notes[index],
                    index,
                    (i) => context.read<NotesProvider>().removeNoteAt(i),
                  ),
                );
              },
            ),
    );
  }
}
