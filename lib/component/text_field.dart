import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class MyTextField extends StatelessWidget {
  MyTextField({super.key,
    required this.labelText,
    required this.hintText,
    required this.stringType,
    this.controller});

  final String labelText;
  final String hintText;
  final bool stringType;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 11,
          child: TextFormField(
            maxLength: labelText == "کد ملی" ? 10 : labelText == "کد احراز هویت" ? 4 : 11,
            textAlignVertical: TextAlignVertical.center,
            controller: controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 20
            ),
            autofocus: true,
            validator: (val) {
              if(labelText == "کد ملی"){
                if (val!.isNotEmpty){
                  return null;
                }else {
                  return "لطفا کد ملی خود را وارد نمایید.";
                }
              } if(labelText == "شماره موبایل"){
                if (val!.isNotEmpty) {
                  return null;
                } else {
                  return "لطفا شماره موبایل خود را وارد نمایید.";
                }
              } if(labelText == "کد احراز هویت"){
                if (val!.isNotEmpty) {
                  return null;
                } else {
                  return "لطفا کد احراز هویت را وارد نمایید.";
                }
              }
              return null;
            },
            decoration: InputDecoration(
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
