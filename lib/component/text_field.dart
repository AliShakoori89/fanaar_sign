import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key,
    required this.labelText,
    required this.hintText,
    required this.stringType,
    required this.controller});

  final String labelText;
  final String hintText;
  final bool stringType;
  final TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 11,
          child: TextField(
            maxLength: labelText == "کد ملی" ? 10 : labelText == "کد احراز هویت" ? 4 : 11,
            textAlignVertical: TextAlignVertical.center,
              controller: controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 20
              ),
              autofocus: true,
              decoration: InputDecoration(
                  // errorText: 'Please enter something',
                contentPadding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 50,
                    bottom: MediaQuery.of(context).size.height / 50,
                  right: MediaQuery.of(context).size.width / 50,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25)
                ),
                labelText: labelText,
              ),
              autocorrect: false,

            )
        )
    );
  }
}
