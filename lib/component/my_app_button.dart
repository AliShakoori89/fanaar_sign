import 'package:fanar_sign/const/app_color.dart';
import 'package:fanar_sign/page/home_page.dart';
import 'package:fanar_sign/page/otpcode_page.dart';
import 'package:flutter/material.dart';

class MyAppButton extends StatelessWidget {
  MyAppButton({super.key,
    this.nationalCodeController,
    this.mobileNumberController,
    this.otpCodController,
    required this.formKey,
    required this.pageName,
    required this.buttonType});

  TextEditingController? nationalCodeController;
  TextEditingController? mobileNumberController;
  TextEditingController? otpCodController;
  final String pageName;
  final bool buttonType;
  final GlobalKey<FormState> formKey;

  String pattern = r'(^\+?09[0-9]{9}$)';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 20,
              right: MediaQuery.of(context).size.width / 20,
              bottom: MediaQuery.of(context).size.width / 20),
          height: MediaQuery.of(context).size.height / 13,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: AppColors.mainColor,
            ),
          ),
          child: Center(
            child: Text("مرحله بعد",
                style: TextStyle(color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width / 20)),
          ),
        ),
        onTap: (){
          RegExp regExp = RegExp(pattern);
        if (formKey.currentState!.validate()) {
          if(pageName == "AuthenticationPage"){
              if(buttonType == true){
                if (nationalCodeController!.text.length == 10) {
                  if (regExp.hasMatch(mobileNumberController!.text)) {

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OTPCodePage()),
                    );

                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                        Text('شماره موبایل وارد شده صحیح نمی باشد.',
                            textDirection: TextDirection.rtl)));
                  }
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content:
                      Text('کد ملی وارد شده صحیح نمی باشد.',
                          textDirection: TextDirection.rtl)));
                }
              }
          }else{
            if(otpCodController!.text == "1111"){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            }else{
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content:
                  Text('کد صادره صحیح نمی باشد.',
                      textDirection: TextDirection.rtl)));
            }
          }
        }

        },
      ),
    );
  }
}
