import 'package:flutter/material.dart';

class EditMobileNumber extends StatelessWidget {
  const EditMobileNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 30,
          left: MediaQuery.of(context).size.width / 12,
          right: MediaQuery.of(context).size.width / 12),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            const Icon(Icons.phone_enabled_outlined),
            GestureDetector(
                child: const Text("ویرایش شماره موبایل"),
            onTap: (){
                  Navigator.pop(context);
            }),
            Text(" | ", style: TextStyle(fontSize: MediaQuery.of(context).size.width / 20,),),
            const Icon(Icons.refresh),
            const Text("درخواست مجدد کد فعالسازی")
          ],
        ),
      ),
    );
  }
}
