import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/Add_Note_cubit/add_note_cubit.dart';
import 'package:note/widget/CustomeTextFiled.dart';
import 'package:note/widget/add_note_form.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class NotesSheet extends StatefulWidget {
  NotesSheet({super.key});

  @override
  State<NotesSheet> createState() => _NotesSheetState();
}

class _NotesSheetState extends State<NotesSheet> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteFailuer) {
          print("failed ${state.errMessage}");
        }
        if (state is AddNoteSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is AddNoteLoading ? true : false,
            child: AddNoteForm());
      },
    );
  }
}
