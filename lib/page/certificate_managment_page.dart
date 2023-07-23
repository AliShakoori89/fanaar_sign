import 'package:fanar_sign/component/main_page_card.dart';
import 'package:fanar_sign/page/no_data_page.dart';
import 'package:flutter/material.dart';
import '../component/floating_action_button.dart';
import '../component/main_page_header.dart';

class CertificateManagementPage extends StatelessWidget {

  final List cardList = ['گواهی نماد','گواهی فتار'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                right: 10
              ),
              child: Text("مدیریت گواهی امضاء",
                  style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 20,
                      color: Colors.white
                  )),
            ),
          )
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.black, Colors.blue]),
          ),
        ),
      ),
      floatingActionButton: MYAppFloatingActionButton(
        buttonName: 'صدور گواهی',
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
