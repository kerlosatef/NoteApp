import 'package:flutter/material.dart';
import 'package:note/widget/Icon_lens.dart';
import 'package:note/widget/constet.color.dart';
import '../../models/note_model.dart';

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: 300,
          child: GridView.builder(
            itemCount: kColors.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                    widget.note.color = kColors[index].value;
                  });
                  Navigator.pop(context);
                },
                child: ColorItem(
                  color: kColors[index],
                  isActive: currentIndex == index,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
