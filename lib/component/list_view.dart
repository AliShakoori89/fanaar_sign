import 'package:fanar_sign/page/authentication_page.dart';
import 'package:fanar_sign/page/certificate_managment_page.dart';
import 'package:fanar_sign/page/my_certificate_page.dart';
import 'package:flutter/material.dart';

class MainPageListView extends StatelessWidget {

  List boxName = ["مدیزیت گواهی امضا","امضای من"];
  List imagePath = ["assets/icon/digital-signature.png", "assets/icon/my-digital-signature-transformed.png"];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 15,),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: boxName.length,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: (){
              if(index == 0){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CertificateManagementPage()),
                );
              }else{
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyCertificatePage()),
                );
              }
            },
            child: Container(
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.width / 3.5,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(color: Color.fromRGBO(139, 139, 139, 0.4),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(
                      0.0, // Move to right 5  horizontally
                      5.0, // Move to bottom 5 Vertically
                    ),),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(imagePath[index], height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.width / 9,
                      color: index/2 == 1 || index/2 == 0 ? Colors.white : Colors.black),
                  SizedBox(height: MediaQuery.of(context).size.height / 100,),
                  Text(boxName[index],
                    style: TextStyle(color: index/2 == 1 || index/2 == 0 ? Colors.white : Colors.black),)
                ],
              ),
            ),
          );
        }
    );
  }
}
