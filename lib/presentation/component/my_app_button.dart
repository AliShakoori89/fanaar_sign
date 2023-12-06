import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../const/app_color.dart';
import '../page/authentication_pages/input_documents_images_page.dart';
import '../page/authentication_pages/input_information_page.dart';
import 'dart:io';
import '../page/authentication_pages/live_video/description_page.dart';
import '../page/authentication_pages/live_video/input_live_video_page.dart';
import '../page/home_page.dart';
import '../page/issued_certificate_page.dart';
import '../page/user_summary_page.dart';
import 'costom_snackbar.dart';

class MyAppButton extends StatelessWidget {
  MyAppButton({super.key,
    this.nationalCodeController,
    this.mobileNumberController,
    this.birthdayController,
    this.nationalCodeSerialController,
    this.postCodeController,
    this.formKey,
    this.index,
    this.image,
    this.existImage1,
    this.existImage2,
    this.verificationBoolean,
    this.cameras,
    this.isRecord,
    this.stateStatus,
    this.checkBox,
    this.selectIntermediateCAName,
    this.selectProduceName,
    required this.pageName});

  File? image;
  String? nationalCodeController;
  String? mobileNumberController;
  String? birthdayController;
  String? nationalCodeSerialController;
  String? postCodeController;
  GlobalKey<FormState>? formKey;
  int? index;
  bool? existImage1;
  bool? existImage2;
  bool? verificationBoolean;
  List<CameraDescription>? cameras;
  bool? isRecord;
  bool? stateStatus;
  bool? checkBox;
  String? selectIntermediateCAName;
  String? selectProduceName;
  final String pageName;


  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
        child: GestureDetector(
          child: Container(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 20,
                right: MediaQuery.of(context).size.width / 20),
            height: MediaQuery.of(context).size.height / 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: AppColors.mainColor,
              ),
            ),
            child: Center(
              child: Text("مرحله بعد",
                  style: TextStyle(color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width / 25)),
            ),
          ),
          onTap: () {
            if (pageName == "IssuedNewCertificatePage") {
              if (selectIntermediateCAName == null) {
                CustomWidgets.buildErrorSnackbar(
                    context, "لطفا مرکز میانی مورد نظر را انتخاب کنید.");
              } else if (selectProduceName == null) {
                CustomWidgets.buildErrorSnackbar(
                    context, "لطفا نام محصول مورد نظر را انتخاب کنید.");
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      InputInformationPage(cameras: cameras!,
                        selectedIntermediateCaItemsValue: selectIntermediateCAName!,
                      selectedCertificateItemsValue: selectProduceName!,)),
                );
              }
            } else if (pageName == "HomePage") {
              if (verificationBoolean == true) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage(cameras: cameras!)),
                );
              } else {
                CustomWidgets.buildErrorSnackbar(context,
                    "لطفا در صورت تایید اطلاعات خود تیک مورد نظر را بفشارید.");
              }
            } else if (pageName == "InputLiveVideo") {
              if (SquareState.isRecord == true) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          UserSummaryPage(
                              nationalCodeController: nationalCodeController!,
                              mobileNumberController: mobileNumberController!,
                              birthdayController: birthdayController!,
                              nationalCodeSerialController: nationalCodeSerialController!,
                              postCodeController: postCodeController!,
                              selectIntermediateCAName: selectIntermediateCAName!,
                              selectProduceName: selectProduceName!,
                              selectedIntermediateCaItemsValue: selectIntermediateCAName!,
                              selectedCertificateItemsValue: selectProduceName!,
                              cameras: cameras!)),
                );
              } else {
                CustomWidgets.buildErrorSnackbar(context,
                    "لطفا ویدیو خود به همراه جمله ای که باید تکرار کنید آپلود نمایید.");
              }
            } else if (pageName == "InputDocumentsImagesPage") {
              if (existImage1 == true && existImage2 == true) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DescriptionPage(
                            nationalCodeController: nationalCodeController!,
                            mobileNumberController: mobileNumberController!,
                            birthdayController: birthdayController!,
                            nationalCodeSerialController: nationalCodeSerialController!,
                            postCodeController: postCodeController!,
                            selectedIntermediateCaItemsValue: selectIntermediateCAName!,
                            selectedCertificateItemsValue: selectProduceName!,
                            cameras: cameras!,
                          )
                  ),
                );
              } else {
                CustomWidgets.buildErrorSnackbar(
                    context, "لطفا عکس موارد خواسته شده را آپلود نمایید.");
              }
            } else if (pageName == "UserSummaryPage") {
              checkBox == true
                  ? Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        IssuedCertificatePage(
                          nationalCodeController: nationalCodeController!,
                          mobileNumberController: mobileNumberController!,
                          birthdayController: birthdayController!,
                          nationalCodeSerialController: nationalCodeSerialController!,
                          postCodeController: postCodeController!,
                          cameras: cameras!,
                          selectIntermediateCAName: selectIntermediateCAName!,
                          selectProduceName: selectProduceName!,
                        )
                ),
              )
                  : CustomWidgets.buildErrorSnackbar(
                  context, "لطفا صحت اطلاعات را تایید نمایید.");
            } else if (pageName == "DescriptionPage") {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        InputLiveVideo(
                          nationalCodeController: nationalCodeController!,
                          mobileNumberController: mobileNumberController!,
                          birthdayController: birthdayController!,
                          nationalCodeSerialController: nationalCodeSerialController!,
                          postCodeController: postCodeController!,
                          selectedIntermediateCaItemsValue: selectIntermediateCAName!,
                          selectedCertificateItemsValue: selectIntermediateCAName!,
                          cameras: cameras!,
                        )
                ),
              );
            } else if (formKey!.currentState!.validate()) {
              if (pageName == "ActivationQRCodePage") {
                CustomWidgets.buildErrorSnackbar(
                    context, "لطفا ORCode مربوطه را اسکن کنید.");
              } else if (pageName == "InputInformationPage") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            InputDocumentsImagesPage(
                              nationalCodeController: nationalCodeController!,
                              mobileNumberController: mobileNumberController!,
                              birthdayController: birthdayController!,
                              nationalCodeSerialController: nationalCodeSerialController!,
                              postCodeController: postCodeController!,
                              selectedIntermediateCaItemsValue: selectIntermediateCAName!,
                              selectedCertificateItemsValue: selectProduceName!,
                              cameras: cameras!,
                            )
                    ),
                  );
              }
            }
          },
        ),
      );
        // : CustomWidgets.buildErrorSnackbar(context,"برای این کد ملی قبلا گواهی صادر شده است.");
  }
}
