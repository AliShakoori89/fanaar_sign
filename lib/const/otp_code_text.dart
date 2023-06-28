import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class OTPCodeText extends StatelessWidget {

  const OTPCodeText({super.key, required this.mobileNumberController});

  final int mobileNumberController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: Text("را وارد کنید.",
              style: TextStyle(fontSize: MediaQuery.of(context).size.width / 26,
                fontWeight: FontWeight.w700,)),
        ),
        const SizedBox(width: 3,),
        Text(0.toString().toPersianDigit(),
            style: TextStyle(fontSize: MediaQuery.of(context).size.width / 26)),
        Text(mobileNumberController.toString().substring(0,3).toString().toPersianDigit(),
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: MediaQuery.of(context).size.width / 26)),
        const Text("****"),
        Text(int.parse(mobileNumberController.toString().substring(8,10)).toString().toPersianDigit(),
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: MediaQuery.of(context).size.width / 26)),
        const SizedBox(width: 3,),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Text("لطفا کد احراز هویت ارسال شده به شماره",
            style: TextStyle(fontSize: MediaQuery.of(context).size.width / 26,
              fontWeight: FontWeight.w700,),),
        ),
      ],
    );
  }
}
