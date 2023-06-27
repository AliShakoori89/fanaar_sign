import 'package:fanar_sign/component/my_app_button.dart';
import 'package:fanar_sign/component/text_field.dart';
import 'package:flutter/material.dart';

import '../component/fanaar_logo.dart';
import '../component/main_page_header.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomSheet: const MyAppButton(),
      body: Column(
        children: [
          const MainPageHeader(mainPage: false),
          SizedBox(height: MediaQuery.of(context).size.height / 6,),
          Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 20, right: MediaQuery.of(context).size.width / 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MyTextField(hintText: "کد ملی", labelText: "کد ملی", stringType: false,),
                SizedBox(height: MediaQuery.of(context).size.height / 30),
                const MyTextField(hintText: "موبایل", labelText: "موبایل", stringType: false,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
