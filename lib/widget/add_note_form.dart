import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note/cubit/addnotes/add_note_cubit.dart';
import 'package:note/models/Note_Model.dart';
import 'package:note/widget/CustomeTextFiled.dart';
import 'package:note/widget/Icon_lens.dart';
import 'package:note/widget/custome_button.dart';

class AddNoteForm extends StatefulWidget {
  AddNoteForm({
    super.key,
    this.isLoading = false,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
  bool isLoading;
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
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
              height: 150,
              child: CustomeTextField(
                onSaved: (value) {
                  subtitle = value;
                },
                texthint: "Content",
                expandeBool: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {}, child: Icon(Icons.date_range, size: 30)),
                    SizedBox(width: 10),
                    IconLens(),
                  ],
                )),
          ),
          const SizedBox(height: 1),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
                return CustomeButton(
                  isLoading: state is AddNoteLoading ? true : false,
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      var noteModel = NoteModel(
                        title: title!,
                        subtitle: subtitle!,
                        date: DateFormat("MM-dd-yyyy").format(DateTime.now()),
                        color: Colors.blue.value,
                      );
                      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Coloritem extends StatelessWidget {
  const Coloritem({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 38,
      backgroundColor: Colors.red,
    );
  }
}

class ColorListView extends StatelessWidget {
  const ColorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Coloritem();
          }),
    );
  }
}
