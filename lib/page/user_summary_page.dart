import 'package:flutter/material.dart';
import '../component/base_appbar.dart';

class UserSummaryPage extends StatelessWidget {

  final String nationalCodeController;
  final String mobileNumberController;
  final String birthdayController;
  final String nationalCodeSerialController;
  final String postCodeController;

  const UserSummaryPage({super.key, required this.nationalCodeController,
    required this.mobileNumberController, required this.nationalCodeSerialController,
    required this.birthdayController, required this.postCodeController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "تصویر مدارک متقاضی",
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1)
        ),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
