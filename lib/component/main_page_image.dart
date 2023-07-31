import 'package:flutter/material.dart';

class MainPageImage extends StatelessWidget {
  const MainPageImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/image/main page image.png")
              )
          ),
        )
    );
  }
}
