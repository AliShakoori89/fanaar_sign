import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../const/app_color.dart';

class CustomDropDownButton extends StatefulWidget {

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  final List<String> items = [
    'مرکز میانی فن آوران اعتماد راهبر',
    'مرکز میانی نماد',
  ];

  String? selectedValue;

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

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
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
    );
  }
}
