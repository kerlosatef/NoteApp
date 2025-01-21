import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField(
      {super.key, this.expandeBool = false, required this.texthint});

  final String texthint;
  final bool expandeBool;

  @override
  Widget build(BuildContext context) {
    return TextField(
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
