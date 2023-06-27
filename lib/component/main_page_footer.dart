import 'package:flutter/material.dart';

import 'list_view.dart';
import 'main_page_card.dart';
import 'main_page_image.dart';

class MainPageFooter extends StatelessWidget {
  const MainPageFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20,),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 15,),
              MainPageListView()
            ],
          ),
        ),
        const SizedBox(height: 15,),
        Expanded(
            flex: 4,
            child: Column(
              children: [
                const SizedBox(height: 15,),
                const MainPageImage(),
                const SizedBox(height: 10,),
                MainPageCard()
              ],
            ))
      ],
    );
  }
}
