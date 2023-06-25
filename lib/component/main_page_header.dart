import 'package:fanar_sign/component/profile_pic.dart';
import 'package:flutter/material.dart';
import 'datetime_now.dart';
import 'fanaar_logo.dart';

class MainPageHeader extends StatelessWidget {
  const MainPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 60,),
                      FanaarLogo(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 80
                      ),
                      DateTimeNow()
                    ],
                  ),
                ProfilePic(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
