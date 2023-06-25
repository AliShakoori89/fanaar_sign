import 'package:fanar_sign/component/list_view.dart';
import 'package:fanar_sign/component/main_page_card.dart';
import 'package:fanar_sign/component/main_page_header.dart';
import 'package:fanar_sign/component/main_page_image.dart';
import 'package:flutter/material.dart';

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
          MainPageHeader(),
          Expanded(
              flex: 8,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 15,),
                        MainPageListView()
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Expanded(
                    flex: 4,
                      child: Column(
                        children: [
                          SizedBox(height: 15,),
                          MainPageImage(),
                          SizedBox(height: 10,),
                          MainPageCard()
                        ],
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
