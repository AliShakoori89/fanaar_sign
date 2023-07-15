import 'package:flutter/material.dart';

class NoDataPage extends StatelessWidget {
  const NoDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height / 4,),
        Image.asset("assets/icon/my-digital-signature-transformed.png",
            width: MediaQuery.of(context).size.width / 3,
        opacity: AlwaysStoppedAnimation(.4)),
        SizedBox(height: MediaQuery.of(context).size.height / 60,),
        Text(
          "گواهی برای نمایش موجود نمی باشد",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height / 50,
            color: Colors.black45,
          ),
        )
      ],
    );;}
}