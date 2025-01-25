import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  CustomeButton({super.key, this.onTap, this.isLoading = false});
  void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: AlignmentDirectional.center,
        child: isLoading
            ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : Text(
                "ADD",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.blue),
      ),
    );
  }
}
