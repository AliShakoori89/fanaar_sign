import 'package:fanar_sign/component/main_page_card.dart';
import 'package:fanar_sign/page/no_data_page.dart';
import 'package:flutter/material.dart';
import '../component/floating_action_button.dart';
import '../component/main_page_header.dart';

class CertificateManagementPage extends StatelessWidget {
  CertificateManagementPage({super.key, required this.mobileNumber});

  final String mobileNumber;

  final List cardList = ['گواهی نماد','گواهی فتار'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MYAppFloatingActionButton(
        buttonName: 'صدور گواهی',
        buttonType: 'CertificateManagementPage',
        mobileNumber: mobileNumber,
        nationalCode: "11111111",),
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
