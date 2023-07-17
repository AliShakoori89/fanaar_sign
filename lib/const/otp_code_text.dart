import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class OTPCodeText extends StatelessWidget {

  const OTPCodeText({super.key, required this.otpCode});

  final String otpCode;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Text("لطفا کد احراز هویت ارسال شده به شماره "
          "${int.parse(otpCode.substring(9,11)).toString().toPersianDigit()} **** "
          " ${otpCode.substring(0,4).toString().toPersianDigit()} "
          "را وارد کنید."
          ,
          style: TextStyle(fontSize: MediaQuery.of(context).size.width / 30,
            fontWeight: FontWeight.w700,)),
    );
  }
}
