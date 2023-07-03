import 'dart:math';

import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({super.key});

  @override
  Widget build(BuildContext context) {

    double L = MediaQuery.of(context).size.width / 5.5; // image side length
    double R = 24; // rounding radius
    double k = sqrt(2) - R / L * 2 * (sqrt(2) - 1);

    return Transform.rotate(
      angle: pi / 4,
      child: Transform.scale(
        scale: 1 / k,
        child: ClipRRect(
          borderRadius: new BorderRadius.circular(R),
          child: Transform.rotate(
            angle: - pi / 4,
            child: Transform.scale(
              scale: k,
              child: Image(
                image: AssetImage("assets/image/profile image.png"),
                width: L,
                height: L,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
    //   CircleAvatar(
    //   foregroundImage: const AssetImage("assets/image/profile image.png"),
    //   radius: MediaQuery.of(context).size.width / 16,
    // );
  }
}
