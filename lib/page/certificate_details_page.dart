import 'package:fanar_sign/component/main_page_header.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../component/base_appbar.dart';
import '../const/app_color.dart';

class CertificateDetails extends StatelessWidget {
  CertificateDetails({super.key, required this.certificateExpirationDate,
  required this.certificateValidityPeriod, required this.selectProduceName});

  final String certificateExpirationDate;
  final String selectProduceName;
  final String certificateValidityPeriod;
  List boxName = ["ابطال گواهی","تجدید گواهی","تمدید گواهی"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "مشخصات گواهی",
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 20,),
          Expanded(
            flex: 2,
            child: Container(
              height: MediaQuery.of(context).size.height / 5,
              margin: const EdgeInsets.only(
                  right: 15,
                  left: 15,
                  bottom: 10
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(color: AppColors.cardShadowColor,
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(
                      0.0, // Move to right 5  horizontally
                      5.0, // Move to bottom 5 Vertically
                    ),),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset("assets/icon/certificate.png")),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 50,
                          left: MediaQuery.of(context).size.width / 50,
                          bottom: MediaQuery.of(context).size.height / 50,
                        top: MediaQuery.of(context).size.height / 30,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(selectProduceName,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w700,
                                        fontSize: MediaQuery.of(context).size.width / 30,
                                    ),)),
                                SizedBox(height: MediaQuery.of(context).size.height / 100,),
                                Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(certificateExpirationDate.toPersianDigit(), style: TextStyle(
                                      color: Colors.blue,
                                        fontWeight: FontWeight.w700,
                                      fontSize: MediaQuery.of(context).size.width / 25,
                                    ),)),
                                SizedBox(height: MediaQuery.of(context).size.height / 150,),
                                Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(certificateValidityPeriod.toPersianDigit(), style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      color: Colors.blue,
                                      fontSize: MediaQuery.of(context).size.width / 25,
                                    ),)),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text("نوع گواهی :", style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      fontSize: MediaQuery.of(context).size.width / 30,
                                    ),)),
                                SizedBox(height: MediaQuery.of(context).size.height / 100,),
                                Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text("تاریخ انقضا :", style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      fontSize: MediaQuery.of(context).size.width / 30,
                                    ),)),
                                SizedBox(height: MediaQuery.of(context).size.height / 100,),
                                Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text("مدت اعتبار :", style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      fontSize: MediaQuery.of(context).size.width / 30,
                                    ),)),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ))
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 40,),
          Expanded(
            flex: 1,
              child: Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width / 50,
                    left: MediaQuery.of(context).size.width / 50,
                ),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(width: 15,),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: boxName.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 3.5,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black26
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffDDDDDD),
                            blurRadius: 6.0,
                            spreadRadius: 2.0,
                            offset: Offset(0.0, 0.0),
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(boxName[index],
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: MediaQuery.of(context).size.width / 30,
                        )),
                      ),
                    );
                  },
              ),
              )
          ),
          Expanded(
            flex: 5,
            child: Container(),
          )
        ],
      ),
    );
  }
}
