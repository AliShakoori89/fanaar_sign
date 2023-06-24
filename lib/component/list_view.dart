import 'package:flutter/material.dart';

class MainPageListView extends StatelessWidget {
  const MainPageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 15,),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (BuildContext context, int index){
          return Container(
            height: MediaQuery.of(context).size.height / 7,
            width: MediaQuery.of(context).size.width / 4,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(color: Color.fromRGBO(139, 139, 139, 0.4),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: Offset(
                    0.0, // Move to right 5  horizontally
                    5.0, // Move to bottom 5 Vertically
                  ),),
                // BoxShadow(color: Color.fromRGBO(139, 139, 139, 1.0),
                //     spreadRadius: 0.5,
                //     blurRadius: 15,
                //     offset: Offset(0, 1)),
                // BoxShadow(color: Color.fromRGBO(139, 139, 139, 1.0),
                //     spreadRadius: 0.5,
                //     blurRadius: 15,
                //     offset: Offset(-1, -1)),
                // BoxShadow(color: Color.fromRGBO(139, 139, 139, 1.0),
                //     spreadRadius: 0.5,
                //     blurRadius: 15,
                //     offset: Offset(-1, 1)),
              ],
              gradient: index/2 == 1 || index/2 == 0
                  ? const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(5,101,178, 1),
                  Color.fromRGBO(21,70,160, 1),
                ],
              )
                  : const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(255, 255, 255, 1.0),
                  Color.fromRGBO(232, 229, 229, 1.0),
                ],
              ) ,
              borderRadius: BorderRadius.circular(25),
            ),
          );
        }
    );
  }
}
