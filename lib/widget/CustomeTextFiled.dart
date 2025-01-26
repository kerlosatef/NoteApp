import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField(
      {super.key,
      this.expandeBool = false,
      required this.texthint,
      this.onSaved,
      this.onChanged});

  final String texthint;
  final bool expandeBool;
  final void Function(String?)? onSaved;
  final Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field is Required";
        } else {
          return null;
        }
      },
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: null,
      expands: expandeBool,
      decoration: InputDecoration(
        hintText: texthint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
