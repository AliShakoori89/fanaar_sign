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
        itemsHeights.add(100);
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
                item != itemName.last ? Expanded(
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
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        itemHeight: MediaQuery.of(context).size.width / 8,
        isDense: false,
        isExpanded: true,
        hint: Center(
          child: Text(
            textAlign: TextAlign.center,
            dropdownButtonName,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 35,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
        ),
        items: _addDividersAfterItems(itemName),
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
          return itemName.map((String value) {
            return Center(
              child: dropdownButtonName == "انتخاب مرکز میانی صدور گواهی"
                  ? Text(selectIntermediateCAName == null
                    ? dropdownButtonName
                    : selectIntermediateCAName!,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width / 35,
                    fontWeight: FontWeight.w700),)
                  : Text(selectProduceName == null
                    ? dropdownButtonName
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

    );
  }
}
