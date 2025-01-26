import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/cubit/notes/notes_cubit.dart';
import 'package:note/widget/NotesListView.dart';
import 'package:note/widget/noteItem.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notes",
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
          SizedBox(height: 5),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
