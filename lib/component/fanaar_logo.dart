import 'package:flutter/material.dart';

class FanaarLogo extends StatelessWidget {
  const FanaarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/logo/fanaar logo.png",
      height: MediaQuery.of(context).size.width / 4,
    );
  }
}
