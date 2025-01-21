import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xfffbcf7e), borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text("Flutter tips",
                  style: TextStyle(
                      color: Colors.black, fontSize: 30, fontWeight: fontwe)),
              subtitle: Text("Build your career with",
                  style: TextStyle(color: Colors.black54, fontSize: 20)),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            ),
            SizedBox(height: 110),
            Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 5),
              child: Text(
                "May 21,2022",
                style: TextStyle(color: Colors.black54),
              ),
            )
          ],
        ),
      ),
    );
  }
}
