import 'package:fanar_sign/const/app%20color/app_color.dart';
import 'package:flutter/material.dart';

class MyAppButton extends StatelessWidget {
  const MyAppButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 20,
          right: MediaQuery.of(context).size.width / 20,
          bottom: MediaQuery.of(context).size.width / 20),
      height: MediaQuery.of(context).size.height / 13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.mainColor,
        ),
      ),
      child: Center(
        child: Text("مرحله بعد",
            style: TextStyle(color: Colors.white,
                fontSize: MediaQuery.of(context).size.width / 20)),
      ),
    );
  }
}
