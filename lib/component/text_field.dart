import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField({super.key,
    required this.labelText,
    required this.hintText,
    this.controller});

  final String labelText;
  final String hintText;
  TextEditingController? controller;

  String pattern = r'(^\+?09[0-9]{9}$)';

  int sum = 0;
  int div = 0;
  int counter = 0;

  @override
  Widget build(BuildContext context) {

    RegExp regExp = RegExp(pattern);

    return Directionality(
        textDirection: TextDirection.rtl,
        child: SizedBox(
            height: MediaQuery.of(context).size.height / 11,
            child: TextFormField(
              maxLength: labelText == "کد ملی"
                  ? 10 : labelText == "سریال کارت ملی"
                  ? 10 : labelText == "شماره موبایل"
                  ? 11 : labelText == "کد پستی"
                  ? 10 : null,
              textAlignVertical: TextAlignVertical.center,
              controller: controller,
              keyboardType: labelText == "سریال کارت ملی" ? null : TextInputType.number,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 20
              ),
              autofocus: true,
              validator: (val) {
                if(labelText == "کد ملی"){
                  if (val!.isNotEmpty){
                    if(val.length == 10){
                      for(int i = 10; i > 1; i--){
                        sum += (i)*int.parse(val[counter]);
                        counter++;
                      }
                      div = int.parse("${sum % 11}");
                      counter = 0;
                      if(div < 2){
                        if(val[9] == div.toString()){
                          return null;
                        }
                      }else if(val[9] == (11-div).toString()){
                        return null;
                      }else{
                        return "کد ملی وارد شده صحیح نمی باشد.";
                      }
                    }else{
                      return "کد ملی وارد شده صحیح نمی باشد.";
                    }
                  }else {
                    return "لطفا کد ملی خود را وارد نمایید.";
                  }
                } if(labelText == "شماره موبایل"){
                  if (val!.isEmpty) {
                    return "لطفا شماره موبایل خود را وارد نمایید.";
                  } else if(val.length != 11) {
                    return "شماره موبایل وارد شده صحیح نمی باشد.";
                    // "لطفا شماره موبایل خود را وارد نمایید.";
                  } else if(!regExp.hasMatch(val)){
                    return "شماره موبایل وارد شده صحیح نمی باشد.";
                  }else{
                    return null;
                  }
                } if(labelText == "سریال کارت ملی"){
                  if(val!.isEmpty){
                    return "لطفا سریال کارت ملی خود را وارد نمایید.";
                  }else{
                    return null;
                  }
                }if(labelText == "کد پستی"){
                  if(val!.isEmpty){
                    return "لطفا کد پستی خود را وارد نمایید.";
                  }else{
                    return null;
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
                hintText: labelText == "کد ملی"
                    ? "0011515740" : labelText == "سریال کارت ملی"
                    ? "3G43454654" : labelText == "شماره موبایل"
                    ? "09122344567" : labelText == "کد پستی"
                    ? "1425561221" : null,
                hintStyle: TextStyle(
                  color: Colors.grey[500]
                )
              ),
              autocorrect: false,
            )
        )
    );
  }
}