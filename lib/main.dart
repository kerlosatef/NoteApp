import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note/cubit/notes/notes_cubit.dart';
import 'package:note/models/Note_Model.dart';
import 'package:note/views/notes_view.dart';
import 'package:note/views/simple_cube_ovserve.dart';

const kNoteBox = 'notes_box';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleCubeOvserve();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNoteBox);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: "Poppins"),
        home: NotesView(),
      ),
    );
  }
}
