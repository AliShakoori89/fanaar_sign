import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class OTPCodeText extends StatelessWidget {

  const OTPCodeText({super.key, required this.otpCodeController});

  final TextEditingController otpCodeController;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Text("لطفا کد احراز هویت ارسال شده به شماره "
          "${int.parse(otpCodeController.toString().substring(8,10)).toString().toPersianDigit()}****"
          " ${0.toString().toPersianDigit()}${otpCodeController.toString().substring(0,3).toString().toPersianDigit()} "
          "را وارد کنید."
          ,
          // maxLines: 1,
          style: TextStyle(fontSize: MediaQuery.of(context).size.width / 30,
            fontWeight: FontWeight.w700,)),
    );
  }
}
