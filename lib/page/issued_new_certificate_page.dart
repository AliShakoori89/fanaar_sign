import 'package:camera/camera.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../component/background_image.dart';
import '../component/base_appbar.dart';
import '../component/my_app_button.dart';
import '../const/app_color.dart';

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
  List<String>? itemName;
  String? dropdownButtonName;
  String? selectIntermediateCAName;
  String? selectProduceName;

  _IssuedNewCertificatePageState(this.cameras);

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    final List<DropdownMenuItem<String>> menuItems = [];
    for (final String item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height / 100
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    textAlign: TextAlign.right,
                    item,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height / 100
                ),
                item != itemName!.last ? Expanded(
                  flex: 1,
                  child: Divider(
                    color: Colors.grey[600],
                    thickness: 1,
                  ),
                ) : Container()
              ],
            ),
          ),
        ],
      );
    }
    return menuItems;
  }

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
              Center(child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                    itemHeight: MediaQuery.of(context).size.width / 8,
                    isDense: false,
                    isExpanded: true,
                    hint: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        "انتخاب مرکز میانی صدور گواهی",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 35,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    items: _addDividersAfterItems(itemName!),
                    value: dropdownButtonName == "انتخاب مرکز میانی صدور گواهی"
                        ? selectIntermediateCAName
                        : selectProduceName,
                    onChanged: (String? value) {
                      setState(() {
                        dropdownButtonName == "انتخاب مرکز میانی صدور گواهی"
                            ? selectIntermediateCAName = value
                            : selectProduceName = value;
                      });
                    },
                    selectedItemBuilder: (BuildContext context) {
                      //<-- SEE HERE
                      return itemName!.map((String value) {
                        return Center(
                            child: dropdownButtonName == "انتخاب مرکز میانی صدور گواهی"
                                ? Text(selectIntermediateCAName == null
                                ? dropdownButtonName!
                                : selectIntermediateCAName!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.width / 35,
                                  fontWeight: FontWeight.w700),)
                                : Text(selectProduceName == null
                                ? dropdownButtonName!
                                : selectProduceName!,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width / 35,
                                    fontWeight: FontWeight.w700))
                        );
                      }).toList();
                    },
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height / 50,),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: AppColors.mainColor,
                      ),
                    ),
                    buttonHeight: MediaQuery.of(context).size.height / 15,
                    buttonWidth: MediaQuery.of(context).size.width / 1.5,
                    // dropdownScrollPadding: const EdgeInsets.symmetric(vertical: 0.0),

                    dropdownDecoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    icon: Icon(Icons.arrow_drop_down, color: Colors.white,
                      size: MediaQuery.of(context).size.height / 30,),
                    iconEnabledColor: Colors.white),

              )),
              SizedBox(height: MediaQuery.of(context).size.height / 25,),
              Align(
                alignment: Alignment.centerRight,
                child: Text("نام محصول",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontWeight: FontWeight.w700,
                    fontSize: MediaQuery.of(context).size.width / 30,),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 100,),
              Center(child: DropdownButton2<String>(
                  itemHeight: MediaQuery.of(context).size.width / 8,
                  isDense: false,
                  isExpanded: true,
                  hint: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      "انتخاب نام محصول",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 35,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  items: _addDividersAfterItems(itemName!),
                  value: dropdownButtonName == "انتخاب مرکز میانی صدور گواهی"
                      ? selectIntermediateCAName
                      : selectProduceName,
                  onChanged: (String? value) {
                    setState(() {
                      dropdownButtonName == "انتخاب مرکز میانی صدور گواهی"
                          ? selectIntermediateCAName = value
                          : selectProduceName = value;
                    });
                  },
                  selectedItemBuilder: (BuildContext context) {
                    //<-- SEE HERE
                    return itemName!.map((String value) {
                      return Center(
                          child: dropdownButtonName == "انتخاب مرکز میانی صدور گواهی"
                              ? Text(selectIntermediateCAName == null
                              ? dropdownButtonName!
                              : selectIntermediateCAName!,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width / 35,
                                fontWeight: FontWeight.w700),)
                              : Text(selectProduceName == null
                              ? dropdownButtonName!
                              : selectProduceName!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.width / 35,
                                  fontWeight: FontWeight.w700))
                      );
                    }).toList();
                  },
                  buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height / 50,),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: AppColors.mainColor,
                    ),
                  ),
                  buttonHeight: MediaQuery.of(context).size.height / 15,
                  buttonWidth: MediaQuery.of(context).size.width / 1.5,
                  // dropdownScrollPadding: const EdgeInsets.symmetric(vertical: 0.0),

                  dropdownDecoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  icon: Icon(Icons.arrow_drop_down, color: Colors.white,
                    size: MediaQuery.of(context).size.height / 30,),
                  iconEnabledColor: Colors.white)),
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
