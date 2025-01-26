import 'package:flutter/material.dart';
import 'package:note/models/Note_Model.dart';
import 'package:note/widget/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.noteItem,
  });
  final NoteModel noteItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return EditNoteView();
          }));
          print("test");
        },
        child: Container(
          padding: EdgeInsets.only(top: 24, bottom: 24, left: 16),
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xfffbcf7e),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  noteItem.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 6),
                  child: Text(
                    noteItem.subtitle,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 27,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text(
                  noteItem.date,
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
