import 'package:fanar_sign/component/profile_pic.dart';
import 'package:fanar_sign/const/app_color.dart';
import 'package:flutter/material.dart';
import 'datetime_now.dart';
import 'fanaar_logo.dart';

class MainPageHeader extends StatelessWidget {
  const MainPageHeader({super.key, required this.mainPage});
  
  final bool mainPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: AppColors.appbarShadowColor,
                spreadRadius: 1,
                blurRadius: 15
            )
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.mainColor,
          ),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(45)
          )
      ),
      child: Container(
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 20,
          right: MediaQuery.of(context).size.width / 20,
          top: MediaQuery.of(context).size.height / 50,
          bottom: MediaQuery.of(context).size.height / 50,

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
                    const FanaarLogo(),
                    mainPage == true ? SizedBox(
                        height: MediaQuery.of(context).size.height / 80
                    ) : const SizedBox(),
                    mainPage == true ? DateTimeNow() : Container()
                  ],
                ),
                mainPage == true ? const ProfilePic() : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
