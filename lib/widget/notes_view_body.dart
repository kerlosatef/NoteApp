import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/cubit/notes/notes_cubit.dart';
import 'package:note/cubit/theme_cubit.dart';
import 'package:note/widget/NotesListView.dart';

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
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    final isDarkMode = themeCubit.state.brightness == Brightness.dark;

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
            child: GestureDetector(
              onTap: () {},
              child: Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      color: isDarkMode
                          ? Colors.white.withOpacity(0.1)
                          : Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(22)),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Text("search",
                          style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontSize: 16,
                          )),
                      SizedBox(width: 50),
                      Icon(
                        Icons.search,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ],
                  )),
            ),
          ),
          SizedBox(width: 17),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: GestureDetector(
              onTap: () {
                themeCubit.toggleTheme();
              },
              child: Icon(
                isDarkMode ? Icons.dark_mode : Icons.light_mode,
              ),
            ),
          ),
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
