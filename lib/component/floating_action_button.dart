import 'package:flutter/material.dart';
import '../const/app_color.dart';
import '../page/activation_page.dart';
import '../page/authentication_page.dart';

class MYAppFloatingActionButton extends StatelessWidget {
  MYAppFloatingActionButton({super.key,
    required this.buttonName,
    required this.buttonType});

  final String buttonName;
  final String buttonType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: FloatingActionButton.extended(
          onPressed: () {
            if(buttonType == "CertificateManagementPage"){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AuthenticationPage()),
              );
            }else if(buttonType == "MyCertificatePage"){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ActivationQRCodePage()),
              );
            }
          },
          backgroundColor: AppColors.appbarShadowColor,
          icon: Icon(Icons.add),
          label: Text(buttonType == "CertificateManagementPage" ? "صدور گواهی جدید" : "فعال سازی",
              style: TextStyle(fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}
