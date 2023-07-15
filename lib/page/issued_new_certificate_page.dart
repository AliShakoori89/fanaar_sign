import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../component/main_page_header.dart';
import '../component/my_app_button.dart';
import '../const/app_color.dart';

class IssuedNewCertificatePage extends StatefulWidget {

  @override
  State<IssuedNewCertificatePage> createState() => _IssuedNewCertificatePageState();
}

class _IssuedNewCertificatePageState extends State<IssuedNewCertificatePage> {

  String? selectedValue;
  final formKey = GlobalKey<FormState>();

  final List<String> items = [
    'مرکز میانی فن آوران اعتماد راهبر',
    'مرکز میانی نماد',
  ];

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    final List<DropdownMenuItem<String>> menuItems = [];
    for (final String item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                textAlign: TextAlign.right,
                item,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            DropdownMenuItem<String>(
              enabled: false,
              child: Divider(
                height: 5,
              ),
            ),
        ],
      );
    }
    return menuItems;
  }

  List<double> _getCustomItemsHeights() {
    final List<double> itemsHeights = [];
    for (int i = 0; i < (items.length * 2) - 1; i++) {
      if (i.isEven) {
        itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        itemsHeights.add(4);
      }
    }
    return itemsHeights;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: MyAppButton(pageName: "IssuedNewCertificatePage", selectedValue: selectedValue, formKey: formKey,),
      body: Column(
        children: [
          const MainPageHeader(mainPage: false),
          SizedBox(height: MediaQuery.of(context).size.height / 20,),
          Form(
            key: formKey,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    'انتخاب مرکز صدور گواهی',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                items: _addDividersAfterItems(items),
                value: selectedValue,
                onChanged: (String? value) {
                  setState(() {
                    selectedValue = value!;
                  });
                },
                selectedItemBuilder: (BuildContext context) {
                  //<-- SEE HERE
                  return <String>[
                    'مرکز میانی فن آوران اعتماد راهبر',
                    'مرکز میانی نماد',
                    ''
                  ].map((String value) {
                    return Center(
                      child: Text(
                        selectedValue == null
                            ? 'انتخاب مرکز صدور گواهی'
                            : selectedValue!,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width / 30,
                            fontWeight: FontWeight.w700),
                      ),
                    );
                  }).toList();
                },
                buttonStyleData: ButtonStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: AppColors.mainColor,
                      ),
                    )),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: MediaQuery.of(context).size.height / 10,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15))),
                menuItemStyleData: MenuItemStyleData(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  customHeights: _getCustomItemsHeights(),
                ),
                // style: TextStyle(
                //   color: Colors.white,
                // ),

                iconStyleData: const IconStyleData(
                    openMenuIcon: Icon(Icons.arrow_drop_up, color: Colors.white),
                    iconEnabledColor: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
