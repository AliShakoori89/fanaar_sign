import 'package:fanar_sign/component/my_app_button.dart';
import 'package:fanar_sign/component/otp_app_button.dart';
import 'package:fanar_sign/const/edit_mobile_number.dart';
import 'package:fanar_sign/const/otp_code_text.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../component/main_page_header.dart';
import '../component/text_field.dart';

class OTPCodePage extends StatefulWidget {
  const OTPCodePage({super.key, required this.mobileNumberController});

  final int mobileNumberController;

  @override
  State<OTPCodePage> createState() => _OTPCodePageState(mobileNumberController);
}

class _OTPCodePageState extends State<OTPCodePage> {

  late TextEditingController otpCodeController = TextEditingController();
  final int mobileNumberController;

  _OTPCodePageState(this.mobileNumberController);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: OTPAppButton( otpCodController: otpCodeController),
      body: Column(
        children: [
          const MainPageHeader(mainPage: false),
          Container(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 20,
                right: MediaQuery.of(context).size.width / 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 4),
                OTPCodeText(mobileNumberController: mobileNumberController),
                SizedBox(height: MediaQuery.of(context).size.height / 30),
                MyTextField(controller: otpCodeController,
                  stringType: false,
                  hintText: "کد احراز هویت",
                  labelText: "کد احراز هویت"),
                const EditMobileNumber()
              ],
            ),
          )
        ],
      ),
    );
  }
}
