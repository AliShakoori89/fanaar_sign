import 'package:fanar_sign/const/app_color.dart';
import 'package:fanar_sign/page/home_page.dart';
import 'package:fanar_sign/page/otpcode_page.dart';
import 'package:flutter/material.dart';

class OTPAppButton extends StatefulWidget {
  OTPAppButton({super.key,
    this.otpCodController});

  TextEditingController? otpCodController;

  @override
  State<OTPAppButton> createState() => _MyOTPAppButton(
      this.otpCodController,);
}

class _MyOTPAppButton extends State<OTPAppButton> {
  TextEditingController? otpCodController;
  String pattern = r'(^\+?09[0-9]{9}$)';

  _MyOTPAppButton(this.otpCodController);

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
          if (widget.otpCodController!.text.isNotEmpty){
            if(widget.otpCodController!.text != 1111){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }else{
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content:
                  Text('کد وارد شده صحیح نمی باشد.',
                      textDirection: TextDirection.rtl)));
            }
          }else{
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content:
                Text('کد ارسال شده را وارد نمایید.',
                    textDirection: TextDirection.rtl)));
          }
        },
      ),
    );
  }
}
