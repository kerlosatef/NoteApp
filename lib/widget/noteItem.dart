import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xfffbcf7e), borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          ListTile(
            title: Text("Flutter tips",
                style: TextStyle(color: Colors.black, fontSize: 30)),
          )
        ],
      ),
    );
  }
}
