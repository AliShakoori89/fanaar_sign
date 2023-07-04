import 'package:fanar_sign/const/app_color.dart';
import 'package:flutter/material.dart';

import '../component/main_page_header.dart';

class IssuedCertificatePage extends StatelessWidget {
  const IssuedCertificatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width / 3,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: FloatingActionButton.extended(
            onPressed: () {},
            backgroundColor: AppColors.appbarShadowColor,
            icon: Icon(Icons.add),
            label: Text("صدور گواهی",
            style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ),
      ),
      body: Column(
        children: [
          MainPageHeader(mainPage: false),
          Container(),
        ],
      ),
    );
  }
}
