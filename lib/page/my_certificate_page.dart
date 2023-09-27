import 'package:fanar_sign/component/floating_action_button.dart';
import 'package:flutter/material.dart';
import '../component/background_image.dart';
import '../component/base_appbar.dart';

class MyCertificatePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "امضاهای من",
      ),
      floatingActionButton: MYAppFloatingActionButton(
          buttonName: "فعالسازی",
          buttonType:"MyCertificatePage"),
      body: Container(
        decoration: baseBackgroundDecoration,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 50,),
             // MainPageCard();
          ],
        ),
      ),
    );
  }
}
