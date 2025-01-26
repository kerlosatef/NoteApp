import 'package:flutter/material.dart';
import 'package:note/models/Note_Model.dart';
import 'package:note/widget/edit_note_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteBody(note: note),
    );
  }
}
