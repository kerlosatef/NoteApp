import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/cubit/addnotes/add_note_cubit.dart';
import 'package:note/cubit/notes/notes_cubit.dart';
import 'package:note/models/Note_Model.dart';
import 'package:note/widget/CustomeTextFiled.dart';
import 'package:note/widget/Icon_lens.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class EditNoteBody extends StatefulWidget {
  const EditNoteBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteBody> createState() => _EditNoteBodyState();
}

class _EditNoteBodyState extends State<EditNoteBody> {
  DateTime? selectedDate; // المتغير الذي سيحتفظ بالقيمة

  void _showColorDialog(BuildContext context) async {
    final selectedColor = await showDialog<Color>(
      context: context,
      builder: (context) => const ColorsListView(),
    );

    if (selectedColor != null) {
      BlocProvider.of<AddNoteCubit>(context).color = selectedColor;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    String? title, subtitle;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Notes",
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
                child: GestureDetector(
                  onTap: () {
                    widget.note.title = title ?? widget.note.title;
                    widget.note.subtitle = subtitle ?? widget.note.subtitle;
                    widget.note.save();
                    Navigator.pop(context);
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  },
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomeTextField(
              onChanged: (value) {
                title = value;
              },
              texthint: widget.note.title,
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 160,
              child: CustomeTextField(
                onChanged: (value) {
                  subtitle = value;
                },
                texthint: widget.note.subtitle,
                expandeBool: true,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
