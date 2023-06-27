import 'package:fanar_sign/component/list_view.dart';
import 'package:fanar_sign/component/main_page_card.dart';
import 'package:fanar_sign/component/main_page_header.dart';
import 'package:fanar_sign/component/main_page_image.dart';
import 'package:flutter/material.dart';

import '../component/main_page_footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
              child: MainPageHeader(mainPage: true)),
          Expanded(
              flex: 10,
              child: MainPageFooter())
        ],
      ),
    );
  }
}
