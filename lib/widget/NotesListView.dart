import 'package:flutter/material.dart';
import 'package:note/widget/noteItem.dart';

class NotesListView extends StatelessWidget {
  NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: NoteItem(),
        );
      },
    );
  }
}
