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
  String searchQuery = '';
  FocusNode focusNode = FocusNode();

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
            padding: const EdgeInsets.only(top: 10.0),
            child: GestureDetector(
              // هذا الـ GestureDetector سيغطى الشاشة بالكامل
              onTap: () {
                focusNode.unfocus();
              },
              child: Container(
                width: 190,
                height: 50,
                padding: const EdgeInsets.only(right: 10),
                child: TextField(
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 14),
                    hintText: 'Search Notes...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(right: 20),
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
      body: GestureDetector(
        onTap: () {
          focusNode.unfocus();
        },
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<NotesCubit, NotesState>(
                builder: (context, state) {
                  if (state is NotesSuccess) {
                    final notes = context.read<NotesCubit>().notes ?? [];
                    final filteredNotes = notes
                        .where((note) => note.title
                            .toLowerCase()
                            .contains(searchQuery.toLowerCase()))
                        .toList();

                    return NotesListView(notes: filteredNotes);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
