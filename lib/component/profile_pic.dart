import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      foregroundImage: const AssetImage("assets/image/profile image.png"),
      radius: MediaQuery.of(context).size.width / 16,
    );
  }
}
