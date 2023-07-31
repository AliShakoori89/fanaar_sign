import 'package:fanar_sign/const/app_color.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../page/authentication_pages/input_documents_images_page.dart';
import '../page/authentication_pages/input_information_page.dart';
import 'dart:io';

import '../page/certificate_managment_page.dart';
import '../page/my_certificate_page.dart';
import '../page/user_summary_page.dart';

class MyAppButton extends StatelessWidget {
  MyAppButton({super.key,
    this.nationalCodeController,
    this.mobileNumberController,
    this.birthdayController,
    this.nationalCodeSerialController,
    this.postCodeController,
    this.formKey,
    this.selectedValue,
    this.index,
    this.image,
    this.existImage1,
    this.existImage2,
    required this.pageName});

  File? image;
  String? nationalCodeController;
  String? mobileNumberController;
  String? birthdayController;
  String? nationalCodeSerialController;
  String? postCodeController;
  GlobalKey<FormState>? formKey;
  String? selectedValue;
  int? index;
  bool? existImage1;
  bool? existImage2;

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
            if(pageName == "IssuedNewCertificatePage"){
            if(selectedValue != null){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InputInformationPage()),
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
          }
          else if(pageName == "InputInformationPage" ){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InputDocumentsImagesPage(
                nationalCodeController: nationalCodeSerialController!,
                mobileNumberController: mobileNumberController!,
                birthdayController: birthdayController!,
                nationalCodeSerialController: nationalCodeSerialController!,
                postCodeController: postCodeController!,)),
            );
          }
          else if(pageName == "InputDocumentsImagesPage"){
            if(existImage1 == true && existImage2 == true){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InputDocumentsImagesPage(
                  nationalCodeController: nationalCodeSerialController!,
                  mobileNumberController: mobileNumberController!,
                  birthdayController: birthdayController!,
                  nationalCodeSerialController: nationalCodeSerialController!,
                  postCodeController: postCodeController!
                )),
              );
            }
            else{
              showTopSnackBar(
                Overlay.of(context),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: CustomSnackBar.error(
                    message:
                    "لطفا عکس موارد خواسته شده را آپلود نمایید.",
                    backgroundColor: Colors.red.shade300,
                  ),
                ),
              );
            }
          } else if(pageName == "UserSummaryPage"){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserSummaryPage(
                    nationalCodeController: nationalCodeSerialController!,
                    mobileNumberController: mobileNumberController!,
                    birthdayController: birthdayController!,
                    nationalCodeSerialController: nationalCodeSerialController!,
                    postCodeController: postCodeController!
                )),
              );
            }
        }
        },
      ),
    );
  }
}
