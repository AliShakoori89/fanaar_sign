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
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 30,),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Divider(
                    thickness: 2,
                    color: Colors.black26,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 50,),
                Expanded(
                    flex: 2,
                    child: Text("مشخصات محصول", style: TextStyle(
                        fontWeight: FontWeight.w700
                    ),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
