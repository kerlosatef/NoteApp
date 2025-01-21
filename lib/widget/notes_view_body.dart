import 'package:flutter/material.dart';
import 'package:note/widget/noteItem.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "notes",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 5),
            child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Color(0xff3d3d3d),
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: Column(
        children: [
          NoteItem(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
