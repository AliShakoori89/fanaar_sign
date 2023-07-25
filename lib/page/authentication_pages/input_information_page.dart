import 'package:fanar_sign/component/base_appbar.dart';
import 'package:fanar_sign/component/datetime_picker_textfield.dart';
import 'package:fanar_sign/component/my_app_button.dart';
import 'package:fanar_sign/component/text_field.dart';
import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../component/main_page_header.dart';

class InputInformationPage extends StatefulWidget {
  InputInformationPage({super.key, this.index});
  int? index;

  @override
  State<InputInformationPage> createState() => _InputInformationPageState(index);
}

class _InputInformationPageState extends State<InputInformationPage> {

  late TextEditingController nationalCodeController = TextEditingController();
  late TextEditingController mobileNumberController = TextEditingController();
  late TextEditingController birthdayController = TextEditingController();
  late TextEditingController nationalCodeSerialController = TextEditingController();
  late TextEditingController postCodeController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int? index;

  _InputInformationPageState(this.index);

  @override
  void dispose() {
    nationalCodeController.dispose();
    mobileNumberController.dispose();
    birthdayController.dispose();
    nationalCodeSerialController.dispose();
    postCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: 'مشخصات متقاضی'),
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      bottomSheet: MyAppButton(
          nationalCodeController: nationalCodeController.text,
          mobileNumberController: mobileNumberController.text,
          birthdayController: birthdayController.text,
          nationalCodeSerialController: nationalCodeSerialController.text,
          postCodeController: postCodeController.text,
          pageName: "AuthenticationPage",
          formKey: formKey,
          index : index),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 5,),
            Container(
              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 20, right: MediaQuery.of(context).size.width / 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyTextField(
                      hintText: "کد ملی",
                      labelText: "کد ملی",
                      controller: nationalCodeController),
                  SizedBox(height: MediaQuery.of(context).size.height / 50),
                  MyTextField(
                      hintText: "شماره موبایل",
                      labelText: "شماره موبایل",
                      controller: mobileNumberController
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 50),
                  DateTimePickerTextField(
                      hintText: "تاریخ تولد",
                      labelText: "تاریخ تولد",
                      controller: birthdayController
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 25),
                  MyTextField(
                      hintText: "سریال کارت ملی",
                      labelText: "سریال کارت ملی",
                      controller: nationalCodeSerialController
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 50),
                  MyTextField(
                      hintText: "کد پستی",
                      labelText: "کد پستی",
                      controller: postCodeController
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
