import 'package:fanar_sign/component/dropdown_button.dart';
import 'package:fanar_sign/component/my_app_button.dart';
import 'package:flutter/material.dart';

import '../component/main_page_header.dart';

class IssuedNewCertificatePage extends StatelessWidget {

  TextEditingController issuedCertificateController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: MyAppButton( otpCodController: issuedCertificateController, pageName: "IssuedNewCertificatePage", buttonType: true, formKey: formKey),
      body: Column(
        children: [
          const MainPageHeader(mainPage: false),
          SizedBox(height: MediaQuery.of(context).size.height / 20,),
          DropDownButton(),
        ],
      ),
    );
  }
}
