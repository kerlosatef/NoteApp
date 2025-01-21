import 'package:flutter/material.dart';
import 'package:note/widget/CustomeTextFiled.dart';

class EditNoteBody extends StatelessWidget {
  const EditNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomeTextField(
              texthint: "Title",
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 160,
              child: CustomeTextField(
                texthint: "Content",
                expandeBool: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
