import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note/cubit/notes/notes_cubit.dart';
import 'package:note/cubit/theme_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NotesCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: NotesView(),
          );
        },
      ),
    );
  }
}
