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
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(5,101,178, 1),
            Color.fromRGBO(21,70,160, 1),
          ],
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
