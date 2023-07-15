import 'package:fanar_sign/component/main_page_card.dart';
import 'package:fanar_sign/const/app_color.dart';
import 'package:fanar_sign/page/issued_new_certificate_page.dart';
import 'package:fanar_sign/page/no_data_page.dart';
import 'package:flutter/material.dart';

import '../component/main_page_header.dart';

class CertificateManagementPage extends StatelessWidget {
  CertificateManagementPage({super.key});

  final List cardList = ['گواهی نماد','گواهی فتار'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width / 3,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IssuedNewCertificatePage()),
              );
            },
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
          cardList.isNotEmpty
              ? MainPageCard(cardList: cardList)
              : NoDataPage(),
        ],
      ),
    );
  }
}
