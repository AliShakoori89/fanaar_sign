import 'package:fanar_sign/const/app_color.dart';
import 'package:fanar_sign/page/certificate_managment_page.dart';
import 'package:fanar_sign/page/home_page.dart';
import 'package:fanar_sign/page/my_certificate_page.dart';
import 'package:fanar_sign/page/otpcode_page.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../page/authentication_page.dart';
import '../page/input_information_page.dart';

class MyAppButton extends StatelessWidget {
  MyAppButton({super.key,
    this.nationalCodeController,
    this.mobileNumberController,
    this.otpCodController,
    this.formKey,
    this.selectedValue,
    this.index,
    required this.pageName});

  String? nationalCodeController;
  String? mobileNumberController;
  TextEditingController? otpCodController;
  GlobalKey<FormState>? formKey;
  String? selectedValue;
  int? index;

  final String pageName;


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
        if (formKey!.currentState!.validate()) {
          if(pageName == "OTPCodePage"){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }else if(pageName == "IssuedNewCertificatePage"){
            if(selectedValue != null){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AuthenticationPage()),
              );
            }else{
              showTopSnackBar(
                snackBarPosition: SnackBarPosition.top,
                Overlay.of(context),
                CustomSnackBar.success(
                  backgroundColor: Colors.black26,
                  message:
                  ".مرکز میانی مورد نظر را انتخاب کنید",
                ),
              );
            }
          }else if(pageName == "ActivationQRCodePage"){
            showTopSnackBar(
              snackBarPosition: SnackBarPosition.top,
              Overlay.of(context),
              Directionality(
                textDirection: TextDirection.rtl,
                child: CustomSnackBar.success(
                  backgroundColor: Colors.black26,
                  message:
                  "لطفا ORCode مربوطه را اسکن کنید.",
                ),
              ),
            );

          }else if(pageName == "CheckOTPCodePage" ){
            if(index == 0){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CertificateManagementPage()),
              );
            }else{
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyCertificatePage()),
              );
            }
          }else if(pageName == "AuthenticationPage"){
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => OTPCodePage(
            //       mobileNumber: mobileNumberController,
            //   nationalCode: nationalCodeController,)),
            // );
          }
        }
        },
      ),
    );
  }
}
