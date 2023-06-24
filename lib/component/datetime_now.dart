import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:shamsi_date/shamsi_date.dart';

class DateTimeNow extends StatelessWidget {
  DateTimeNow({super.key});

  String date = Jalali.now().day < 10 && Jalali.now().month < 10
      ? "${Jalali.now().year}-0${Jalali.now().month}-0${Jalali.now().day}"
      : Jalali.now().month < 10
      ? "${Jalali.now().year}-0${Jalali.now().month}-${Jalali.now().day}"
      : "${Jalali.now().year}-${Jalali.now().month}-0${Jalali.now().day}";

  @override
  Widget build(BuildContext context) {
    return Text(date.toPersianDigit(),
      style: TextStyle(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.height / 40
      ),);
  }
}
