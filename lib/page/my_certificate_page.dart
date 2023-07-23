import 'package:fanar_sign/component/floating_action_button.dart';
import 'package:fanar_sign/component/main_page_card.dart';
import 'package:fanar_sign/component/main_page_header.dart';
import 'package:flutter/material.dart';

class MyCertificatePage extends StatelessWidget {

  List cardName = ["سرویس خدمات 1","سرویس خدمات 2","سرویس خدمات 3","سرویس خدمات 4"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MYAppFloatingActionButton(
          buttonName: "فعالسازی",
          buttonType:"MyCertificatePage"),
      body: Column(
        children: [
          MainPageHeader(mainPage: false),
          SizedBox(height: MediaQuery.of(context).size.height / 50,),
          MainPageCard(cardList: cardName)
        ],
      ),
    );
  }
}
