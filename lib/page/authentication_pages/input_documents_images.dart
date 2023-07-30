import 'package:fanar_sign/component/base_appbar.dart';
import 'package:fanar_sign/component/show_model_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

import '../../component/my_app_button.dart';

class InputDocumentsImages extends StatefulWidget {

  @override
  State<InputDocumentsImages> createState() => _InputDocumentsImagesState();
}

class _InputDocumentsImagesState extends State<InputDocumentsImages> {

  File? cameraImage;
  File? galleryImage;

  cameraConnect() async {
    var img = await ImagePicker().pickImage(source: ImageSource.camera);
    cameraImage = File(img!.path);
    setState(() {});
  }

  galleryConnect() async {
    var img = await ImagePicker().pickImage(source: ImageSource.gallery);
    galleryImage = File(img!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: MyAppButton(
          pageName: "InputInformationPage",
      ),
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
                  child: cameraImage == null
                      ? Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/image/image not found.png"),
                          fit: BoxFit.fill
                        ),
                        boxShadow: const [
                          BoxShadow(color: Color.fromRGBO(139, 139, 139, 0.4),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(
                              0.0, // Move to right 5  horizontally
                              5.0, // Move to bottom 5 Vertically
                            ),),
                        ],
                      )
                  )
                      : Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(cameraImage!),
                            fit: BoxFit.fill
                        ),
                        boxShadow: const [
                          BoxShadow(color: Color.fromRGBO(139, 139, 139, 0.4),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(
                              0.0, // Move to right 5  horizontally
                              5.0, // Move to bottom 5 Vertically
                            ),),
                        ],
                      )
                  )
                )
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue)
                    ),
                    onPressed: cameraConnect,
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
                  child: galleryImage == null
                      ? Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/image/image not found.png"),
                            fit: BoxFit.fill
                        ),
                        boxShadow: const [
                          BoxShadow(color: Color.fromRGBO(139, 139, 139, 0.4),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(
                              0.0, // Move to right 5  horizontally
                              5.0, // Move to bottom 5 Vertically
                            ),),
                        ],
                      )
                  )
                      : Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(galleryImage!),
                            fit: BoxFit.fill
                        ),
                        boxShadow: const [
                          BoxShadow(color: Color.fromRGBO(139, 139, 139, 0.4),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(
                              0.0, // Move to right 5  horizontally
                              5.0, // Move to bottom 5 Vertically
                            ),),
                        ],
                      )
                  )
                ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue)
                    ),
                    onPressed: galleryConnect,
                    child: Text('آپلود عکس',
                      style: TextStyle(
                          color: Colors.white
                      ),)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 8,)
          ],
        ),
      ),
    );
  }
}
