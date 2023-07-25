import 'package:flutter/material.dart';
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

  Jalali picked = Jalali.now();

  String selectedDate = "";

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
        style: TextStyle(fontSize: 20),
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
          picked = (await showPersianDatePicker(
            context: context,
            initialDate: Jalali.now(),
            firstDate: Jalali(1385, 8),
            lastDate: Jalali(1450, 9),
            builder: (context, child) {
              return child!;
            },
          ))!;
          if (picked != selectedDate) {
            setState(() {
              label = picked.toJalaliDateTime();
            });
          }

          if (!mounted) return;

          if(picked.month.toString().length != 1){
            if(picked.day.toString().length != 1){
              month = "${picked.year}-${picked.month}";
              date = "${picked.year}-${picked.month}-${picked.day}";
            }else{
              month = "${picked.year}-${picked.month}";
              date = "${picked.year}-${picked.month}-0${picked.day}";
            }
          }else{
            if(picked.day.toString().length != 1){
              month = "${picked.year}-0${picked.month}";
              date = "${picked.year}-0${picked.month}-${picked.day}";
            }else{
              month = "${picked.year}-0${picked.month}";
              date = "${picked.year}-0${picked.month}-0${picked.day}";
            }
          }

          controller!.text = date;
        },
      ),
    );
  }
}
