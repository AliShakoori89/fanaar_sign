import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../const/app_color.dart';

class CustomDropDownButton extends StatefulWidget {

  final List<String> itemName;
  final String dropdownButtonName;

  CustomDropDownButton({super.key, required this.dropdownButtonName,
    required this.itemName});

  @override
  State<CustomDropDownButton> createState() => CustomDropDownButtonState(itemName, dropdownButtonName);
}

class CustomDropDownButtonState extends State<CustomDropDownButton> {

  final List<String> itemName;
  final String dropdownButtonName;
  static String? selectIntermediateCAName;
  static String? selectProduceName;

  CustomDropDownButtonState(this.itemName, this.dropdownButtonName);

  List<double> _getCustomItemsHeights() {
    final List<double> itemsHeights = [];
    for (int i = 0; i < (itemName.length * 2) - 1; i++) {
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
            dropdownButtonName,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 30,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
        ),
        items: _addDividersAfterItems(itemName),
        value: dropdownButtonName == "انتخاب مرکز میانی صدور گواهی" ? selectIntermediateCAName : selectProduceName,
        onChanged: (String? value) {
          setState(() {
            dropdownButtonName == "انتخاب مرکز میانی صدور گواهی"
                ? selectIntermediateCAName = value
                : selectProduceName = value;
          });
        },
        selectedItemBuilder: (BuildContext context) {
          //<-- SEE HERE
          return itemName.map((String value) {
            return Center(
              child: dropdownButtonName == "انتخاب مرکز میانی صدور گواهی"
                  ? Text(selectIntermediateCAName == null
                    ? dropdownButtonName
                    : selectIntermediateCAName!,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width / 30,
                    fontWeight: FontWeight.w700),)
                  : Text(selectProduceName == null
                    ? dropdownButtonName
                    : selectProduceName!,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width / 30,
                      fontWeight: FontWeight.w700))
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
