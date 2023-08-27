import 'package:camera/camera.dart';
import 'package:fanar_sign/component/custom_drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../component/background_image.dart';
import '../component/base_appbar.dart';
import '../component/my_app_button.dart';

class IssuedNewCertificatePage extends StatefulWidget {

  final List<CameraDescription> cameras;

  IssuedNewCertificatePage({super.key, required this.cameras});

  @override
  State<IssuedNewCertificatePage> createState() => _IssuedNewCertificatePageState(cameras);
}

class _IssuedNewCertificatePageState extends State<IssuedNewCertificatePage> {

  final List<String> intermediateCAName = [
    'مرکز میانی فن آوران اعتماد راهبر',
    'مرکز میانی نماد'
  ];

  final List<String> produceName = [
    'گواهی موبایل برنز حقیقی مستقل'
  ];

  final List<CameraDescription> cameras;

  _IssuedNewCertificatePageState(this.cameras);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MyAppButton(
        pageName: "IssuedNewCertificatePage",
        cameras: cameras,
      ),
      appBar: BaseAppBar(title: 'صدور گواهی جدید'),
      body: Container(
        decoration: baseBackgroundDecoration,
        child: Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 25,
            left: MediaQuery.of(context).size.width / 25,
            right: MediaQuery.of(context).size.width / 25,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text("نام مرکز صدور گواهی",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontWeight: FontWeight.w700,
                  fontSize: MediaQuery.of(context).size.width / 30,),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 100,),
              Center(child: CustomDropDownButton(
                  dropdownButtonName: "انتخاب مرکز میانی صدور گواهی",
                  itemName: intermediateCAName)),
              SizedBox(height: MediaQuery.of(context).size.height / 25,),
              Align(
                alignment: Alignment.centerRight,
                child: Text("نام محصول",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontWeight: FontWeight.w700,
                    fontSize: MediaQuery.of(context).size.width / 30,),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 100,),
              Center(child: CustomDropDownButton(dropdownButtonName: "انتخاب نام محصول", itemName: produceName)),
              SizedBox(height: MediaQuery.of(context).size.height / 25,),
              Align(
                alignment: Alignment.centerRight,
                child: Text("مبلغ قابل پرداخت",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontWeight: FontWeight.w700,
                    fontSize: MediaQuery.of(context).size.width / 30,),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 100,),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text("ریال",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(fontWeight: FontWeight.w700,
                      fontSize: MediaQuery.of(context).size.width / 25),),
                    SizedBox(width: MediaQuery.of(context).size.width / 100,),
                    Text("272500".toPersianDigit(),
                      textDirection: TextDirection.ltr,
                      style: TextStyle(fontWeight: FontWeight.w700,
                          fontSize: MediaQuery.of(context).size.width / 25),),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 25,),
              Align(
                alignment: Alignment.centerRight,
                child: Text("توضیحات",
                  style: TextStyle(fontWeight: FontWeight.w700,
                      fontSize: MediaQuery.of(context).size.width / 25),)
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 100,),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text("احراز هویت در این گواهی نامه غیر حضوری می باشد هزینه اعلامی شامل هزینه صدور گواهی نامه و هزینه احراز هویت غیر حضوری با اعمال ارزش افزوده می باشد.",
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontWeight: FontWeight.w500,

                        fontSize: MediaQuery.of(context).size.width / 30),)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
