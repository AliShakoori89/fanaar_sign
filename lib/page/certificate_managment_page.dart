import 'package:fanar_sign/component/main_page_card.dart';
import 'package:fanar_sign/page/no_data_page.dart';
import 'package:flutter/material.dart';
import '../component/base_appbar.dart';
import '../component/floating_action_button.dart';

class CertificateManagementPage extends StatelessWidget {

  final List cardList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: "مدیریت گواهی امضاء"),
      floatingActionButton: MYAppFloatingActionButton(
        buttonName: 'صدور گواهی جدید',
        buttonType: 'CertificateManagementPage'),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          cardList.isNotEmpty
              ? MainPageCard(cardList: cardList)
              : NoDataPage(),
        ],
      ),
    );
  }
}
