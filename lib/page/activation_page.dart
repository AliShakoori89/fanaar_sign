import 'package:barcode_scan2/gen/protos/protos.pb.dart';
import 'package:barcode_scan2/gen/protos/protos.pbenum.dart';
import 'package:barcode_scan2/model/android_options.dart';
import 'package:barcode_scan2/model/scan_options.dart';
import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:fanar_sign/component/main_page_header.dart';
import 'package:fanar_sign/component/my_app_button.dart';
import 'package:fanar_sign/page/home_page.dart';
import 'package:fanar_sign/page/successfully_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ActivationQRCodePage extends StatefulWidget {
  const ActivationQRCodePage({super.key});

  @override
  State<ActivationQRCodePage> createState() => _ActivationQRCodePageState();
}

class _ActivationQRCodePageState extends State<ActivationQRCodePage> {

  final _flashOnController = TextEditingController(text: 'Flash on');
  final _flashOffController = TextEditingController(text: 'Flash off');
  final _cancelController = TextEditingController(text: 'Cancel');

  static final _possibleFormats = BarcodeFormat.values.toList()
    ..removeWhere((e) => e == BarcodeFormat.unknown);

  List<BarcodeFormat> selectedFormats = [..._possibleFormats];

  var _aspectTolerance = 0.00;
  var _numberOfCameras = 0;
  var _selectedCamera = -1;
  var _useAutoFocus = true;
  var _autoEnableFlash = false;

  ScanResult? scanResult;

  final formKey = GlobalKey<FormState>();

  Future<void> _scan() async {
    try {
      final result = await BarcodeScanner.scan(
        options: ScanOptions(
          strings: {
            'cancel': _cancelController.text,
            'flash_on': _flashOnController.text,
            'flash_off': _flashOffController.text,
          },
          restrictFormat: selectedFormats,
          useCamera: _selectedCamera,
          autoEnableFlash: _autoEnableFlash,
          android: AndroidOptions(
            aspectTolerance: _aspectTolerance,
            useAutoFocus: _useAutoFocus,
          ),
        ),
      );
      setState(() => scanResult = result as ScanResult?);
    } on PlatformException catch (e) {
      setState(() {
        scanResult = ScanResult(
          type: ResultType.Error,
          rawContent: e.code == BarcodeScanner.cameraAccessDenied
              ? 'The user did not grant the camera permission!'
              : 'Unknown error: $e',
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: MyAppButton(pageName: 'ActivationQRCodePage',formKey: formKey,
      ),
      body: Column(
        children: [
          MainPageHeader(mainPage: false),
          SizedBox(
            height: MediaQuery.of(context).size.height / 5,),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Form(
              key: formKey,
              child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xff1257A2),),
                    elevation: MaterialStateProperty.all(5),
                  ),
                  onPressed: (){
                    _scan();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return SuccessScreen();
                        },
                      ),
                    );
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => HomePage(),));
                  },
                  child: Text("اسکن QRCode",
                  style: TextStyle(
                    color: Colors.white
                  ),)),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 30,),
          Directionality(
            textDirection: TextDirection.rtl,
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.2,
              child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xff1257A2),),
                    elevation: MaterialStateProperty.all(5),
                  ),
                  onPressed: _scan,
                  child: Text("فعال سازی دستی",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                        color: Colors.white
                    ),)),
            ),
          ),
        ],
      ),
    );
  }
}