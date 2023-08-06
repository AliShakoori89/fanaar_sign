import 'package:fanar_sign/bloc/certificate_store/state.dart';
import 'package:fanar_sign/component/floating_action_button.dart';
import 'package:fanar_sign/component/main_page_card.dart';
import 'package:fanar_sign/component/main_page_header.dart';
import 'package:fanar_sign/model/certificate_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/certificate_store/bloc.dart';
import '../component/base_appbar.dart';

class MyCertificatePage extends StatelessWidget {

  MyCertificatePage({required this.certList});

  final List certList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "امضاهای من",
      ),
      floatingActionButton: MYAppFloatingActionButton(
          buttonName: "فعالسازی",
          buttonType:"MyCertificatePage"),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 50,),
          MainPageCard(cardList: certList)
        ],
      ),
    );
  }
}
