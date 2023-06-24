import 'package:fanar_sign/component/list_view.dart';
import 'package:fanar_sign/component/main_page_header.dart';
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
    return Scaffold(
      body: Column(
        children: [
          const MainPageHeader(),
          Expanded(
              flex: 8,
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  const Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 15,),
                        MainPageListView()
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Expanded(
                    flex: 4,
                      child: Column(
                        children: [
                          const SizedBox(height: 15,),
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("assets/image/main page image.png")
                                )
                              ),
                              )),
                          const SizedBox(height: 15,),
                          Expanded(
                            flex: 7,
                            child: Container(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
