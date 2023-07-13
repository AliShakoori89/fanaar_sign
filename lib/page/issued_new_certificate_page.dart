import 'package:fanar_sign/component/dropdown_button.dart';
import 'package:flutter/material.dart';

import '../component/main_page_header.dart';

class IssuedNewCertificatePage extends StatefulWidget {
  IssuedNewCertificatePage({super.key});

  @override
  State<IssuedNewCertificatePage> createState() => _IssuedNewCertificatePageState();
}

class _IssuedNewCertificatePageState extends State<IssuedNewCertificatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const MainPageHeader(mainPage: false),
          SizedBox(height: MediaQuery.of(context).size.height / 20,),
          DropDownButton()
        ],
      ),
    );
  }
}
