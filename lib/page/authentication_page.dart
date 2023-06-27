import 'package:flutter/material.dart';

import '../component/fanaar_logo.dart';
import '../component/main_page_header.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          const MainPageHeader(mainPage: false),
          SizedBox(height: MediaQuery.of(context).size.height / 6,),
          Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 20, right: MediaQuery.of(context).size.width / 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 20
                      ),
                      autofocus: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)
                          ),
                          labelText: "کد ملی",
                          hintText: "کد ملی خود را وارد کنید"
                      ),
                    )
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 30),
                const TextField(
                  decoration: InputDecoration(
                    labelText: "شماره موبایل",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
