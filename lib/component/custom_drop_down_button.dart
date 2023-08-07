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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 1.0),
                  child: Text(
                    textAlign: TextAlign.right,
                    item,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                )
              ],
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
                fontSize: MediaQuery.of(context).size.width / 35,
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
        dropdownScrollPadding: const EdgeInsets.symmetric(vertical: 0.0),
        dropdownMaxHeight: MediaQuery.of(context).size.width / 5,
        dropdownDecoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        icon: Icon(Icons.arrow_drop_down, color: Colors.white,
        size: MediaQuery.of(context).size.height / 30,),
          iconEnabledColor: Colors.white),

    );
  }
}
