import 'package:fanar_sign/component/base_appbar.dart';
import 'package:flutter/material.dart';

class InputDocumentsImages extends StatelessWidget {
  const InputDocumentsImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "تصویر مدارک متقاضی",
      ),
    );
  }
}
