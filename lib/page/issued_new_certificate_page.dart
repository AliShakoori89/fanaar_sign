import 'package:fanar_sign/component/custom_drop_down_button.dart';
import 'package:flutter/material.dart';

import '../component/base_appbar.dart';

class IssuedNewCertificatePage extends StatefulWidget {

  @override
  State<IssuedNewCertificatePage> createState() => _IssuedNewCertificatePageState();
}

class _IssuedNewCertificatePageState extends State<IssuedNewCertificatePage> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: 'صدور گواهی جدید'),
      // bottomSheet: MyAppButton(pageName: "IssuedNewCertificatePage", selectedValue: selectedValue, formKey: formKey,),
      body: Center(
        child: Form(
          key: formKey,
          child: CustomDropDownButton(),
        ),
      ),
    );
  }
}
