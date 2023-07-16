import 'package:fanar_sign/const/app_color.dart';
import 'package:fanar_sign/page/certificate_details_page.dart';
import 'package:flutter/material.dart';

class MainPageCard extends StatelessWidget {
  MainPageCard({super.key, required this.cardList});

  final List cardList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: ListView.builder(
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CertificateDetails(certificateName: cardList[index],)),
                );
              },
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
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
                      BoxShadow(color: AppColors.cardShadowColor,
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(
                          0.0, // Move to right 5  horizontally
                          5.0, // Move to bottom 5 Vertically
                        ),),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width / 20
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        cardList[index],
                        style: TextStyle(color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width / 25,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: cardList.length),
    );
  }
}
