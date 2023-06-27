import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 20
          ),
          autofocus: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25)
              ),
              labelText: "کد ملی",
              hintText: "کد ملی خود را وارد کنید"
          ),
        )
    );
  }
}
