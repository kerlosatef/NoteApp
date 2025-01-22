import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note/models/Note_Model.dart';
import 'package:note/views/notes_view.dart';

const kNoteBox = 'notes_box';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNoteBox);
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: "Poppins"),
      home: NotesView(),
    );
  }
}
