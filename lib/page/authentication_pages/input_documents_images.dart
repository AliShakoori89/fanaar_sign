import 'package:fanar_sign/component/base_appbar.dart';
import 'package:fanar_sign/component/show_model_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class InputDocumentsImages extends StatefulWidget {
  InputDocumentsImages({super.key, this.image});

  File? image;

  @override
  State<InputDocumentsImages> createState() => _InputDocumentsImagesState(image);
}

class _InputDocumentsImagesState extends State<InputDocumentsImages> {

  // Future getImage() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   image.path = prefs.getString("nationalCodeImage");
  // }

  File? image;

  _InputDocumentsImagesState(this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "تصویر مدارک متقاضی",
      ),
      body: Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 30,
          right: MediaQuery.of(context).size.width / 30,
          left: MediaQuery.of(context).size.width / 30
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Text("لطفا عکس کارت ملی خود را آپلود نمایید.",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 25,
                fontWeight: FontWeight.w700
              ),),
            ),
            Expanded(
              flex: 7,
                child: Container(
                  margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width / 50,
                    left: MediaQuery.of(context).size.width / 50,
                    top: MediaQuery.of(context).size.height / 100,
                    bottom: MediaQuery.of(context).size.height / 50
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: image == null
                            ? AssetImage("assets/image/image not found.png")
                            : AssetImage(image!.path)),
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
                )
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue)
                  ),
                    onPressed: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return ShowModelBottomSheet(image: image);
                          });
                    },
                    child: Text('آپلود عکس',
                      style: TextStyle(
                        color: Colors.white
                      ),)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 50,),
            Expanded(
              flex: 1,
              child: Text("لطفا عکس پشت کارت ملی خود را آپلود نمایید.",
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 25,
                    fontWeight: FontWeight.w700
                ),),
            ),
            Expanded(
              flex: 7,
              child: Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width / 50,
                    left: MediaQuery.of(context).size.width / 50,
                    top: MediaQuery.of(context).size.height / 100,
                    bottom: MediaQuery.of(context).size.height / 50
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: image == null
                          ? AssetImage("assets/image/image not found.png")
                          : AssetImage(image!.path)),
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
              )
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue)
                    ),
                    onPressed: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return ShowModelBottomSheet(image: image);
                          });
                    },
                    child: Text('آپلود عکس',
                      style: TextStyle(
                          color: Colors.white
                      ),)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 50,)
          ],
        ),
      ),
    );
  }
}
