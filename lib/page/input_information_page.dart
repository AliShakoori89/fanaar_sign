import 'package:flutter/material.dart';
import '../component/main_page_header.dart';

class InputInformationPage extends StatelessWidget {
  const InputInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const MainPageHeader(mainPage: false),
        ],
      ),
    );
  }
}
