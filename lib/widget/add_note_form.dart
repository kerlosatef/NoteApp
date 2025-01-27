import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note/cubit/addnotes/add_note_cubit.dart';
import 'package:note/models/Note_Model.dart';
import 'package:note/widget/CustomeTextFiled.dart';
import 'package:note/widget/Icon_lens.dart';
import 'package:note/widget/custome_button.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
  DateTime? selectedDate; // المتغير الذي سيحتفظ بالقيمة

  void _showColorDialog(BuildContext context) async {
    final selectedColor = await showDialog<Color>(
      context: context,
      builder: (context) => const ColorsListView(),
    );

    if (selectedColor != null) {
      // تحديث اللون المختار
      BlocProvider.of<AddNoteCubit>(context).color = selectedColor;
      setState(() {});
    }
  }

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
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 20,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: 300,
                                      height: 350,
                                      child: SfDateRangePicker(
                                        view: DateRangePickerView.month,
                                        onSelectionChanged:
                                            (DateRangePickerSelectionChangedArgs
                                                args) {
                                          setState(() {
                                            if (args.value is DateTime) {
                                              selectedDate = args
                                                  .value; // حفظ التاريخ المحدد
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Done"),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: const Icon(Icons.date_range, size: 30),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        _showColorDialog(context);
                      },
                      child: const Icon(Icons.color_lens, size: 30),
                    ),
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
                        date: selectedDate != null
                            ? DateFormat.yMMMd().format(selectedDate!)
                            : DateFormat.yMMMd().format(DateTime.now()),
                        color: Colors.blueAccent.value,
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
