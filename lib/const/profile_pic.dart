import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.only(
        top: 20
      ),
      child: CircleAvatar(
        foregroundImage: AssetImage("assets/image/profile image.png"),
        radius: 30,
      ),
    );
  }
}
