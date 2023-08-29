import 'package:camera/camera.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
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

  final List<CameraDescription> cameras;

  _IssuedNewCertificatePageState(this.cameras);

  final List<String> intermediateCaItems = [
    'مرکز میانی فن آوران اعتماد راهبر',
    'مرکز میانی نماد'
  ];

  final List<String> certificateItems = [
    'گواهی موبایل برنز حقیقی مستقل'
  ];

  String? selectedIntermediateCaItemsValue;
  String? selectedCertificateItemsValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MyAppButton(
        pageName: "IssuedNewCertificatePage",
        selectIntermediateCAName: selectedIntermediateCaItemsValue,
        selectProduceName: selectedCertificateItemsValue,
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
              Center(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Text(
                          'انتخاب مرکز میانی صادر کننده گواهی',
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        items: intermediateCaItems
                            .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          alignment: Alignment.centerRight,
                        ))
                            .toList(),
                        value: selectedIntermediateCaItemsValue,
                        onChanged: (String? value) {
                          setState(() {
                            selectedIntermediateCaItemsValue = value;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: MediaQuery.of(context).size.width / 10,
                          width: MediaQuery.of(context).size.width / 1.5,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            color: Colors.white,
                          ),
                          elevation: 2,
                        ),
                        alignment: Alignment.centerRight,
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: MediaQuery.of(context).size.height / 7,
                          width: MediaQuery.of(context).size.width / 1.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                          ),
                          offset: const Offset(-20, 0),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all<double>(6),
                            thumbVisibility: MaterialStateProperty.all<bool>(true),
                          ),
                        ),
                        menuItemStyleData: MenuItemStyleData(
                          height: MediaQuery.of(context).size.width / 10,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                      ),
                    ),
                  )
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 25,),
              Align(
                alignment: Alignment.centerRight,
                child: Text("نام محصول",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontWeight: FontWeight.w700,
                    fontSize: MediaQuery.of(context).size.width / 30,),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 100,),
              Center(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Text(
                          'انتخاب نوع گواهی',
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        items: certificateItems
                            .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          alignment: Alignment.centerRight,
                        ))
                            .toList(),
                        value: selectedCertificateItemsValue,
                        onChanged: (String? value) {
                          setState(() {
                            selectedCertificateItemsValue = value;
                          });
                        },
                        iconStyleData: IconStyleData(
                          iconSize: MediaQuery.of(context).size.width / 20,
                        ),
                        buttonStyleData: ButtonStyleData(
                          height: MediaQuery.of(context).size.width / 10,
                          width: MediaQuery.of(context).size.width / 1.5,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            color: Colors.white,
                          ),
                          elevation: 2,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: MediaQuery.of(context).size.height / 7,
                          width: MediaQuery.of(context).size.width / 1.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                          ),
                          offset: const Offset(-20, 0),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all<double>(6),
                            thumbVisibility: MaterialStateProperty.all<bool>(true),
                          ),
                        ),
                        menuItemStyleData: MenuItemStyleData(
                          height: MediaQuery.of(context).size.width / 10,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                      ),
                    ),
                  )
              ),
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
