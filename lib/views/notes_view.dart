import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/cubit/notes/notes_cubit.dart';
import 'package:note/cubit/theme_cubit.dart';
import 'package:note/widget/Notes_sheet.dart';
import 'package:note/widget/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    final isDarkMode = themeCubit.state.brightness == Brightness.dark;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: isDarkMode ? Colors.white : Colors.black,
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return NotesSheet();
              });
        },
        child: Icon(
          Icons.add,
          color: isDarkMode ? Colors.black : Colors.white,
        ),
      ),
      body: NotesViewBody(),
    );
  }
}
