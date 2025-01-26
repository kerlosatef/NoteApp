import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/cubit/addnotes/add_note_cubit.dart';
import 'package:note/cubit/notes/notes_cubit.dart';
import 'package:note/widget/add_note_form.dart';

class NotesSheet extends StatefulWidget {
  const NotesSheet({super.key});

  @override
  State<NotesSheet> createState() => _NotesSheetState();
}

class _NotesSheetState extends State<NotesSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailuer) {
            // Handle failure state (optional)
          }
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
              left: 8,
              right: 8,
              top: 8,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Wrap(
              children: [
                AbsorbPointer(
                  absorbing: state is AddNoteLoading,
                  child: AddNoteForm(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
