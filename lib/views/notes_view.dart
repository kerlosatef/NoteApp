import 'package:flutter/material.dart';
import 'package:note/widget/Notes_sheet.dart';
import 'package:note/widget/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotesViewBody(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.blue,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return NotesSheet();
                });
          }),
    );
  }
}
