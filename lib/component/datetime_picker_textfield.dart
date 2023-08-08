import 'package:flutter/material.dart';
import 'package:flutter_linear_datepicker/flutter_datepicker.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class DateTimePickerTextField extends StatefulWidget {
  DateTimePickerTextField({super.key, required this.labelText,
    required this.hintText,
    this.controller});

  final String labelText;
  final String hintText;
  TextEditingController? controller;

  @override
  State<DateTimePickerTextField> createState() => _DateTimePickerTextFieldState(labelText, hintText, controller);
}

class _DateTimePickerTextFieldState extends State<DateTimePickerTextField> {


  final String labelText;
  final String hintText;
  TextEditingController? controller;

  _DateTimePickerTextFieldState(this.labelText, this.hintText, this.controller);

  static String selectedDate = "";

  String label = '';

  String month = "${Jalali.now().year}-${Jalali.now().month}";

  String date = Jalali.now().day < 10 && Jalali.now().month < 10
      ? "${Jalali.now().year}-0${Jalali.now().month}-0${Jalali.now().day}"
      : Jalali.now().month < 10
      ? "${Jalali.now().year}-0${Jalali.now().month}-${Jalali.now().day}"
      : "${Jalali.now().year}-${Jalali.now().month}-0${Jalali.now().day}";

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        style: TextStyle(fontSize: MediaQuery.of(context).size.width / 20),
        textAlign: TextAlign.left,
        showCursor: false,
        controller: widget.controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 50,
            bottom: MediaQuery.of(context).size.height / 50,
            right: MediaQuery.of(context).size.width / 50,
            left: MediaQuery.of(context).size.width / 50,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25)
          ),
          labelText: "تاریخ تولد",
        ),
        validator: (val){
          if(val!.isEmpty){
            return "لطفا تاریخ تولد خود را وارد نمایید.";
          }else{
            return null;
          }
        },
        onTap: () async{

          showDialog(
              context: context,
              builder: (_) =>
                  AlertDialog(
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("انتخاب")),
              ],
              title: Text(
                'تاریخ تولد خود را انتخاب کنید.',
                textDirection: TextDirection.rtl,
                style:
                    TextStyle(fontSize: MediaQuery.of(context).size.width / 25),
              ),
              content: LinearDatePicker(
                startDate: "1300/01/01",
                endDate: "1402/01/01",
                initialDate: "1400/01/01",
                addLeadingZero: true,
                dateChangeListener: (String selectDate) {
                  setState(() {
                    selectedDate = selectDate;
                    controller!.text = selectedDate;
                  });
                },
                showDay: true,
                labelStyle: TextStyle(
                  fontFamily: 'iran',
                  fontSize: MediaQuery.of(context).size.width / 30,
                  color: Colors.black,
                ),
                selectedRowStyle: TextStyle(
                  fontFamily: 'iran',
                  fontSize: MediaQuery.of(context).size.width / 30,
                  color: Colors.deepOrange,
                ),
                unselectedRowStyle: TextStyle(
                  fontFamily: 'iran',
                  fontSize: MediaQuery.of(context).size.width / 30,
                  color: Colors.blueGrey,
                ),
                yearText: "سال",
                monthText: "ماه",
                dayText: "روز",
                showLabels: true,
                columnWidth: MediaQuery.of(context).size.width / 6,
                showMonthName: true,
                isJalaali: true,
              ),
            ),
            );
        },
      ),
    );
  }

}
