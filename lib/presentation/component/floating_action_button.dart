import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../const/app_color.dart';
import '../page/activation_page.dart';
import '../page/authentication_pages/input_information_page.dart';
import '../page/issued_new_certificate_page.dart';

class MYAppFloatingActionButton extends StatelessWidget {
  MYAppFloatingActionButton({super.key,
    required this.buttonName,
    required this.buttonType,
    this.cameras,});

  final String buttonName;
  final String buttonType;
  List<CameraDescription>? cameras;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 15,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: FloatingActionButton.extended(
          onPressed: () {
            if(buttonType == "CertificateManagementPage"){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IssuedNewCertificatePage(cameras: cameras!)),
              );
            }else if(buttonType == "MyCertificatePage"){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ActivationQRCodePage()),
              );
            }
          },
          backgroundColor: AppColors.appbarShadowColor,
          icon: Icon(Icons.add, size: MediaQuery.of(context).size.width / 30),
          label: Text(buttonType == "CertificateManagementPage" ? "صدور گواهی جدید" : "فعال سازی",
              style: TextStyle(fontWeight: FontWeight.w700,
              fontSize: MediaQuery.of(context).size.width / 30,)),
        ),
      ),
    );
  }
}
