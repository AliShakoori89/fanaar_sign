import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key, required this.labelText, required this.hintText, required this.stringType, required this.controller});

  final String labelText;
  final String hintText;
  final bool stringType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 20
          ),
          autofocus: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25)
              ),
              labelText: labelText,
              hintText: hintText
          ),
        )
    );
  }
}
