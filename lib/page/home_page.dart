import 'package:fanar_sign/const/datetime_now.dart';
import 'package:fanar_sign/const/fanaar_logo.dart';
import 'package:fanar_sign/const/profile_pic.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:intl/intl.dart';

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
            child: Container(
              margin: const EdgeInsets.all(
                30
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FanaarLogo(),
                      ProfilePic()
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80
                  ),
                  DateTimeNow()
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(
                30
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(5,101,178, 1),
                              Color.fromRGBO(21,70,160, 1),
                            ],
                          ),
                            border: Border.all(color: Colors.black, width: 3.0)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  flex: 7,
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 3.0)),
                      ),
                    ),
                  ),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}
