import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField(
      {super.key,
      this.expandeBool = false,
      required this.texthint,
      this.onSaved});

  final String texthint;
  final bool expandeBool;
  final void Function(String?)? onSaved;
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
