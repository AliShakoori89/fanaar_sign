import 'package:fanar_sign/const/app_color.dart';
import 'package:fanar_sign/page/home_page.dart';
import 'package:fanar_sign/page/otpcode_page.dart';
import 'package:flutter/material.dart';

class MyAppButton extends StatefulWidget {
  MyAppButton({super.key,
    this.nationalCodeController,
    this.mobileNumberController,
    this.otpCodController,
    required this.buttonType});

  TextEditingController? nationalCodeController;
  TextEditingController? mobileNumberController;
  TextEditingController? otpCodController;
  final bool buttonType;

  @override
  State<MyAppButton> createState() => _MyAppButtonState(
      this.nationalCodeController,
      this.mobileNumberController,
      this.otpCodController,
      this.buttonType
  );
}

class _MyAppButtonState extends State<MyAppButton> {
  final bool buttonType;
  TextEditingController? nationalCodeController;
  TextEditingController? mobileNumberController;
  TextEditingController? otpCodController;
  String pattern = r'(^\+?09[0-9]{9}$)';

  _MyAppButtonState(this.nationalCodeController,
      this.mobileNumberController,
      this.otpCodController,
      this.buttonType);

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
          if (widget.nationalCodeController!.text.isNotEmpty &&
              widget.mobileNumberController!.text.isNotEmpty){
            if(buttonType == true){
              if (widget.nationalCodeController!.text.length == 10) {
                if (regExp.hasMatch(widget.mobileNumberController!.text)) {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OTPCodePage(mobileNumberController: int.parse(widget.mobileNumberController!.text))),
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
            }else{
              if(widget.otpCodController!.text == "1111"){
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
          }else{
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content:
                Text('لطفا تمام فیلدها را پر کنید.',
                textDirection: TextDirection.rtl)));
          }
        },
      ),
    );
  }
}
