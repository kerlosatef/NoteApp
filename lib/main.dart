import 'package:flutter/material.dart';
import 'package:note/views/notes_view.dart';

void main() {
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
