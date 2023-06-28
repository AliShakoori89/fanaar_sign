import 'dart:io';

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
    return WillPopScope(
      onWillPop: _onWillPop,
      child: const Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
                child: MainPageHeader(mainPage: true)),
            Expanded(
                flex: 10,
                child: MainPageFooter())
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Directionality(
            textDirection: TextDirection.rtl,
            child: Text('مطمئن هستید؟')),
        content: const Directionality(
            textDirection: TextDirection.rtl,
            child: Text('آیا می خواهید از برنامه خارج شوید.')),
        actions: <Widget>[
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('خیر'),
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('بله'),
            ),
          ),
        ],
      ),
    )) ?? false;
  }
}
