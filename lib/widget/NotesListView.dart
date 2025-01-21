import 'package:flutter/material.dart';
import 'package:note/widget/noteItem.dart';

class NotesListView extends StatelessWidget {
  NotesListView({super.key});

  final ColorItemlist = [
    Color(0xfffbcf7e),
    Color(0xffe2e998),
    Color(0xff78d2ea),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ColorItemlist.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: NoteItem(colorItem: ColorItemlist[index]),
        );
      },
    );
  }
}
