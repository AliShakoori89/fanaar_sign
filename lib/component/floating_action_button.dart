import 'package:flutter/material.dart';

import '../const/app_color.dart';
import '../page/activation_page.dart';
import '../page/issued_new_certificate_page.dart';

class MYAppFloatingActionButton extends StatelessWidget {
  const MYAppFloatingActionButton({super.key, required this.buttonName, required this.buttonType});

  final String buttonName;
  final String buttonType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: FloatingActionButton.extended(
          onPressed: () {
            if(buttonType == "CertificateManagementPage"){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IssuedNewCertificatePage()),
              );
            }else if(buttonType == "MyCertificatePage"){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ActivationCode()),
              );
            }
          },
          backgroundColor: AppColors.appbarShadowColor,
          icon: Icon(Icons.add),
          label: Text(buttonName,
              style: TextStyle(fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}
