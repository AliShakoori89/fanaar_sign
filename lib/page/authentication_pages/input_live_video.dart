import 'package:fanar_sign/component/base_appbar.dart';
import 'package:flutter/material.dart';
import "dart:math";

class InputLiveVideo extends StatelessWidget {
  InputLiveVideo({super.key});

  var list = [
    'a',
    'b',
    'c',
    'd',
    'e'];

  final _random = new Random();

  @override
  Widget build(BuildContext context) {

    var element = list[_random.nextInt(list.length)];

    return Scaffold(
      appBar: BaseAppBar(
        title: "ارسال فیلم",
      ),
      body: Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 30,
            right: MediaQuery.of(context).size.width / 30,
            left: MediaQuery.of(context).size.width / 30
        ),
        child: Column(
          children: [
            Text("لطفا تصویر خود را همراه با تکرار جمله مربوطه ارسال نمایید.",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 25,
                  fontWeight: FontWeight.w700
              ),
            textDirection: TextDirection.rtl,),
            SizedBox(height: MediaQuery.of(context).size.height / 30,),
            Text(element)
          ],
        ),
      ),
    );
  }
}
