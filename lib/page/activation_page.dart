// import 'package:barcode_scan2/gen/protos/protos.pb.dart';
// import 'package:barcode_scan2/gen/protos/protos.pbenum.dart';
// import 'package:barcode_scan2/model/android_options.dart';
// import 'package:barcode_scan2/model/scan_options.dart';
// import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:fanar_sign/component/main_page_header.dart';
import 'package:fanar_sign/component/my_app_button.dart';
import 'package:fanar_sign/component/text_field.dart';
import 'package:fanar_sign/page/home_page.dart';
import 'package:fanar_sign/page/successfully_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../const/app_color.dart';

class ActivationQRCodePage extends StatefulWidget {
  ActivationQRCodePage({super.key, required this.nationalCode, required this.mobileNumber});

  final String nationalCode;
  final String mobileNumber;

  @override
  State<ActivationQRCodePage> createState() => _ActivationQRCodePageState(nationalCode, mobileNumber);
}

class _ActivationQRCodePageState extends State<ActivationQRCodePage> {

  final String nationalCode;
  final String mobileNumber;
  late TextEditingController jobCodeController = TextEditingController();

  _ActivationQRCodePageState(this.nationalCode, this.mobileNumber);

  @override
  void dispose() {
    jobCodeController.dispose();
    super.dispose();
  }

  final _flashOnController = TextEditingController(text: 'Flash on');
  final _flashOffController = TextEditingController(text: 'Flash off');
  final _cancelController = TextEditingController(text: 'Cancel');

  // static final _possibleFormats = BarcodeFormat.values.toList()
  //   ..removeWhere((e) => e == BarcodeFormat.unknown);
  //
  // List<BarcodeFormat> selectedFormats = [..._possibleFormats];

  var _aspectTolerance = 0.00;
  var _numberOfCameras = 0;
  var _selectedCamera = -1;
  var _useAutoFocus = true;
  var _autoEnableFlash = false;

  // ScanResult? scanResult;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: MyAppButton(
        pageName: 'ActivationQRCodePage', formKey: formKey,
        mobileNumberController: mobileNumber,
        nationalCodeController: nationalCode,
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            MainPageHeader(mainPage: false),
            SizedBox(height: MediaQuery.of(context).size.height / 15,),
            Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/sample/qrCodExample.png"),
                fit: BoxFit.fill),
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(color: AppColors.cardShadowColor,
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(
                      0.0, // Move to right 5  horizontally
                      5.0, // Move to bottom 5 Vertically
                    ),),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 30,),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xff1257A2),),
                    elevation: MaterialStateProperty.all(15),
                  ),
                  onPressed: () {
                    // _scan();
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => HomePage(),));
                  },
                  child: Text("اسکن QRCode",
                    style: TextStyle(
                        color: Colors.white
                    ),)),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 11,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(color: AppColors.cardShadowColor,
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(
                      0.0, // Move to right 5  horizontally
                      5.0, // Move to bottom 5 Vertically
                    ),),
                ],
              ),
              margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width / 20,
                left: MediaQuery.of(context).size.width / 20,
                top: MediaQuery.of(context).size.height / 30,
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width / 20,
                    left: MediaQuery.of(context).size.width / 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("کد ملی : ",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 25,
                            fontWeight: FontWeight.w700
                        ),),
                      Text(nationalCode, style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 25, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 30,),
            Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 20,
                    right: MediaQuery.of(context).size.width / 20),
                child: MyTextField(labelText: "کد کسب و کار", hintText: "کد کسب و کار", controller: jobCodeController,)),
            Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 20,
                      right: MediaQuery.of(context).size.width / 20),
                  child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xff1257A2),),
                        elevation: MaterialStateProperty.all(15),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()){

                        }
                      }, // _scan,
                      child: Text("فعال سازی دستی",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                        ),)),
                )
            ),
          ],
        ),
      ),
    );
  }
}

  // Future<void> _scan() async {
  //   try {
  //     final result = await BarcodeScanner.scan(
  //       options: ScanOptions(
  //         strings: {
  //           'cancel': _cancelController.text,
  //           'flash_on': _flashOnController.text,
  //           'flash_off': _flashOffController.text,
  //         },
  //         restrictFormat: selectedFormats,
  //         useCamera: _selectedCamera,
  //         autoEnableFlash: _autoEnableFlash,
  //         android: AndroidOptions(
  //           aspectTolerance: _aspectTolerance,
  //           useAutoFocus: _useAutoFocus,
  //         ),
  //       ),
  //     );
  //     setState(() => scanResult = result as ScanResult?);
  //   } on PlatformException catch (e) {
  //     setState(() {
  //       scanResult = ScanResult(
  //         type: ResultType.Error,
  //         rawContent: e.code == BarcodeScanner.cameraAccessDenied
  //             ? 'The user did not grant the camera permission!'
  //             : 'Unknown error: $e',
  //       );
  //     });
  //   }

