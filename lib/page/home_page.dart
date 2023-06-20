import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 4,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(21,70,160, 1),
                    spreadRadius: 1,
                    blurRadius: 15
                )
              ],
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(5,101,178, 1),
                  Color.fromRGBO(21,70,160, 1),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(45)
              )
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("assets/logo/fanaar logo.png")
                  ],
                ),
                Row(
                  children: [
                    
                  ],
                )
              ],
            ),
          ),
          Container()
        ],
      ),
    );
  }
}
