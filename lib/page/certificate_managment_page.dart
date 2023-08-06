import 'package:camera/camera.dart';
import 'package:fanar_sign/component/main_page_card.dart';
import 'package:fanar_sign/page/no_data_page.dart';
import 'package:flutter/material.dart';
import '../component/base_appbar.dart';
import '../component/floating_action_button.dart';

class CertificateManagementPage extends StatelessWidget {

  CertificateManagementPage({required this.certList, required this.cameras});

  final List<CameraDescription> cameras;
  final List certList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: "مدیریت گواهی امضاء"),
      floatingActionButton: MYAppFloatingActionButton(
        buttonName: 'صدور گواهی جدید',
        buttonType: 'CertificateManagementPage',
        cameras: cameras),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          certList.isNotEmpty
              ? MainPageCard(cardList: certList)
              : NoDataPage(),
        ],
      ),
    );
  }
}
