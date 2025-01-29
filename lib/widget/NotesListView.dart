import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/cubit/notes/notes_cubit.dart';
import 'package:note/models/Note_Model.dart';
import 'package:note/widget/noteItem.dart';

class NotesListView extends StatelessWidget {
  final List<NoteModel> notes;

  // نضيف الـ parameter هنا
  NotesListView({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: NoteItem(
            note: notes[index],
          ),
        );
      },
    );
  }
}
