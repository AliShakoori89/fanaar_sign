import 'package:flutter/material.dart';

class MainPageCard extends StatelessWidget {
  const MainPageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: ListView.builder(
          itemBuilder: (BuildContext context, int index){
            return Container(
              height: MediaQuery.of(context).size.height / 12,
              margin: const EdgeInsets.only(
                  right: 15,
                  left: 15,
                  bottom: 10
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(color: Color.fromRGBO(139, 139, 139, 0.4),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(
                      0.0, // Move to right 5  horizontally
                      5.0, // Move to bottom 5 Vertically
                    ),),
                ],
              ),
            );
          },
          itemCount: 3),
    );
  }
}
