import 'package:fanar_sign/component/my_app_button.dart';
import 'package:fanar_sign/component/text_field.dart';
import 'package:flutter/material.dart';
import '../component/main_page_header.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {

  late TextEditingController nationalCodeController = TextEditingController();
  late TextEditingController mobileNumberController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomSheet: MyAppButton(nationalCodeController: nationalCodeController, mobileNumberController: mobileNumberController, buttonType: true),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            const MainPageHeader(mainPage: false),
            SizedBox(height: MediaQuery.of(context).size.height / 6,),
            Container(
              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 20, right: MediaQuery.of(context).size.width / 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyTextField(hintText: "کد ملی", labelText: "کد ملی", stringType: false, controller: nationalCodeController),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  MyTextField(hintText: "موبایل", labelText: "موبایل", stringType: false, controller: mobileNumberController),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
