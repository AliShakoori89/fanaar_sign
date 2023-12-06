import 'package:flutter/material.dart';

class EditMobileNumber extends StatelessWidget {
  const EditMobileNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 30,
          left: MediaQuery.of(context).size.width / 14,
          right: MediaQuery.of(context).size.width / 14),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(Icons.phone_enabled_outlined,
                    size: MediaQuery.of(context).size.width / 28),
                GestureDetector(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text("ویرایش شماره موبایل",
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 30,
                          )),
                    ),
                    onTap: (){
                      Navigator.pop(context);
                    }),
              ],
            ),
            Text(" | ", style: TextStyle(fontSize: MediaQuery.of(context).size.width / 20,),),
            Row(
              children: [
                Icon(Icons.refresh,
                    size: MediaQuery.of(context).size.width / 28),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text("درخواست مجدد کد فعالسازی",
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 30
                      )),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
