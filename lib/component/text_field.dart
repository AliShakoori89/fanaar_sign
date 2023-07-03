import 'package:flutter/material.dart';

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

  String pattern = r'(^\+?09[0-9]{9}$)';

  @override
  Widget build(BuildContext context) {

    RegExp regExp = RegExp(pattern);

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
                  if(val.length == 10){
                    return null;
                  }else{
                    return "'کد ملی وارد شده صحیح نمی باشد.'";
                  }
                }else {
                  return "لطفا کد ملی خود را وارد نمایید.";
                }
              } if(labelText == "شماره موبایل"){
                if (val!.isNotEmpty) {
                  if(val.length == 11 && regExp.hasMatch(val)){
                    return null;
                  }else{
                    return "شماره موبایل وارد شده صحیح نمی باشد.";
                  }
                } else {
                  return "لطفا شماره موبایل خود را وارد نمایید.";
                }
              } if(labelText == "کد احراز هویت"){
                if (val!.isNotEmpty) {
                  if(val == "1111"){
                    return null;
                  } else{
                    return 'کد ارسال شده صحیح نمی باشد.';
                  }
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
