import 'package:fanar_sign/const/datetime_now.dart';
import 'package:fanar_sign/const/fanaar_logo.dart';
import 'package:fanar_sign/const/profile_pic.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(21,70,160, 1),
                      spreadRadius: 1,
                      blurRadius: 15
                  )
                ],
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(5,101,178, 1),
                    Color.fromRGBO(21,70,160, 1),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(45)
                )
              ),
              child: Container(
                margin: const EdgeInsets.all(
                  30
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FanaarLogo(),
                        ProfilePic()
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 80
                    ),
                    DateTimeNow()
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 15,),
                        ListView.separated(
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
                                    BoxShadow(color: Color.fromRGBO(139, 139, 139, 0.5),
                                        spreadRadius: 1,
                                        blurRadius: 15,
                                      offset: Offset(
                                        5.0, // Move to right 5  horizontally
                                        5.0, // Move to bottom 5 Vertically
                                      ),),
                                    // BoxShadow(color: Color.fromRGBO(139, 139, 139, 1.0),
                                    //     spreadRadius: 0.5,
                                    //     blurRadius: 15,
                                    //     offset: Offset(0, 1)),
                                    // BoxShadow(color: Color.fromRGBO(139, 139, 139, 1.0),
                                    //     spreadRadius: 1,
                                    //     blurRadius: 15,
                                    //     offset: Offset(-1, -1)),
                                    // BoxShadow(color: Color.fromRGBO(139, 139, 139, 1.0),
                                    //     spreadRadius: 0.5,
                                    //     blurRadius: 15,
                                    //     offset: Offset(-1, 1)),
                                  ],
                                  gradient: index/2 == 1 || index/2 == 0
                                      ? LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color.fromRGBO(5,101,178, 1),
                                      Color.fromRGBO(21,70,160, 1),
                                    ],
                                  )
                                      : LinearGradient(
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
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Expanded(
                    flex: 4,
                      child: Container(
                    color: Colors.red,
                  ))
                ],
              ))
        ],
      ),
    );
  }
}
