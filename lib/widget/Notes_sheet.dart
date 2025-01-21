import 'package:flutter/material.dart';
import 'package:note/widget/CustomeTextFiled.dart';

class NotesSheet extends StatelessWidget {
  const NotesSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return AddNoteForm();
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomeTextField(
              onSaved: (value) {
                title = value;
              },
              texthint: "Title",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 160,
              child: CustomeTextField(
                  onSaved: (value) {
                    subtitle = value;
                  },
                  texthint: "Content",
                  expandeBool: true),
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              child: Container(
                alignment: AlignmentDirectional.center,
                child: Text(
                  "ADD",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
              ),
            ),
          )
        ],
      ),
    );
  }
}
