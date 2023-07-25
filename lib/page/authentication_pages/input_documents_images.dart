import 'package:fanar_sign/component/base_appbar.dart';
import 'package:fanar_sign/component/show_model_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputDocumentsImages extends StatefulWidget {
  const InputDocumentsImages({super.key});

  @override
  State<InputDocumentsImages> createState() => _InputDocumentsImagesState();
}

class _InputDocumentsImagesState extends State<InputDocumentsImages> {

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
            Text("لطفا عکس کارت ملی خود را آپلود نمایید.",
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 25,
              fontWeight: FontWeight.w700
            ),),
            SizedBox(height: MediaQuery.of(context).size.height / 30,),
            Expanded(
              flex: 2,
              child: Center(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue)
                  ),
                    onPressed: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return ShowModelBottomSheet();
                          });
                    },
                    child: Text('آپلود عکس',
                      style: TextStyle(
                        color: Colors.white
                      ),)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 30,),
            Text("لطفا عکس پشت کارت ملی خود را آپلود نمایید.",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 25,
                  fontWeight: FontWeight.w700
              ),),
            Expanded(
              flex: 2,
              child: Center(
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue)
                    ),
                    onPressed: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return ShowModelBottomSheet();
                          });
                    },
                    child: Text('آپلود عکس',
                      style: TextStyle(
                          color: Colors.white
                      ),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
