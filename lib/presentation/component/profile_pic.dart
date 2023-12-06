import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class ProfilePic extends StatelessWidget {
  const ProfilePic({super.key});

  @override
  Widget build(BuildContext context) {

    double L = MediaQuery.of(context).size.width / 5.5; // image side length
    double R = 24; // rounding radius
    double k = sqrt(2) - R / L * 2 * (sqrt(2) - 1);
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      constraints: BoxConstraints.expand(
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height / 5),
      child: Transform.rotate(
        angle: pi / 4,
        child: Transform.scale(
          scale: 1 / k,
          child: ClipRRect(
            borderRadius: new BorderRadius.circular(R),
            child: Transform.rotate(
              angle: - pi / 4,
              child: Transform.scale(
                scale: k,
                child: Image(
                  image: AssetImage("assets/image/profile image.png"),
                  width: L,
                  height: L,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
      onSelected: (value) {
        if (value == "profile") {
          // add desired output
        }else if(value == "settings"){
          // add desired output
        }else if(value == "logout"){
          exit(0);
        }
      },
      position: PopupMenuPosition.under,
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          value: "profile",
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'پروفایل',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                    fontSize: MediaQuery.of(context).size.width / 25),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 60),
                child: Icon(Icons.account_box),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: "settings",
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'تنظیمات',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: MediaQuery.of(context).size.width / 25),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 60
                  ),
                  child: Icon(Icons.settings)
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: "logout",
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'خروج',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: MediaQuery.of(context).size.width / 25),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 60),
                  child: Icon(Icons.logout)
              ),
            ],
          ),
        ),
      ],
    );
  }
}
