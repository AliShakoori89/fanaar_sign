import 'package:fanar_sign/component/my_app_button.dart';
import 'package:fanar_sign/const/edit_mobile_number.dart';
import 'package:fanar_sign/const/otp_code_text.dart';
import 'package:flutter/material.dart';
import '../component/main_page_header.dart';
import '../component/text_field.dart';

class OTPCodePage extends StatelessWidget {

  OTPCodePage({super.key, required this.mobileNumber});

  TextEditingController otpCodeController = TextEditingController();
  final TextEditingController mobileNumber;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: MyAppButton( otpCodController: otpCodeController, pageName: "OTPCodePage", buttonType: true, formKey: formKey),
      body: Form(
        key: formKey,
        child: Column(
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
                  OTPCodeText(otpCode: mobileNumber),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  MyTextField(
                    controller: otpCodeController,
                    stringType: false,
                    hintText: "کد احراز هویت",
                    labelText: "کد احراز هویت",),
                  const EditMobileNumber()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
