import 'package:fanar_sign/component/custom_drop_down_button.dart';
import 'package:flutter/material.dart';
import '../component/base_appbar.dart';
import '../component/my_app_button.dart';

class UserSummaryPage extends StatefulWidget {

  final String nationalCodeController;
  final String mobileNumberController;
  final String birthdayController;
  final String nationalCodeSerialController;
  final String postCodeController;


  const UserSummaryPage({super.key, required this.nationalCodeController,
    required this.mobileNumberController, required this.birthdayController,
    required this.nationalCodeSerialController, required this.postCodeController});

  @override
  State<UserSummaryPage> createState() => _UserSummaryPageState(nationalCodeController, mobileNumberController,
  birthdayController, nationalCodeSerialController, postCodeController);
}

class _UserSummaryPageState extends State<UserSummaryPage> {

  _UserSummaryPageState(this.nationalCodeController, this.mobileNumberController, this.birthdayController,
      this.nationalCodeSerialController, this.postCodeController);

  final String nationalCodeController;
  final String mobileNumberController;
  final String birthdayController;
  final String nationalCodeSerialController;
  final String postCodeController;
  bool valueFirst = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "تصویر مدارک متقاضی",
      ),
      bottomSheet: MyAppButton(
          pageName: "HomePage",
          verificationBoolean: valueFirst,
          ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Text("تایید و ثبت مشخصات", style: TextStyle(
                fontWeight: FontWeight.w700
            )),
            SizedBox(height: MediaQuery.of(context).size.height / 60,),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Divider(
                    thickness: 2,
                    color: Colors.black26,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 50,),
                Expanded(
                    flex: 2,
                    child: Text("مشخصات محصول", style: TextStyle(
                        fontWeight: FontWeight.w700,
                      color: Colors.blue
                    ),)),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width / 20,
                left: MediaQuery.of(context).size.width / 20,
                top: MediaQuery.of(context).size.height / 40
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(CustomDropDownButtonState.selectIntermediateCAName!,
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 30,
                              color: Colors.blue
                          )),
                      SizedBox(height: MediaQuery.of(context).size.height / 50,),
                      Text(CustomDropDownButtonState.selectProduceName!,
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 30,
                              color: Colors.blue
                          ))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("نام مرکز میانی صادر کننده",
                      style: TextStyle(
                        fontWeight: FontWeight.w700
                      )),
                      SizedBox(height: MediaQuery.of(context).size.height / 50,),
                      Text("نام محصول",
                          style: TextStyle(
                              fontWeight: FontWeight.w700
                          ))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 60,),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Divider(
                    thickness: 2,
                    color: Colors.black26,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 50,),
                Expanded(
                    flex: 3,
                    child: Text("اطلاعات هویتی متقاضی", style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.blue
                    ),)),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 20,
                  left: MediaQuery.of(context).size.width / 20,
                  top: MediaQuery.of(context).size.height / 40
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("علی اکبر",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width / 30,
                                  color: Colors.blue
                              )
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("تعالی",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width / 30,
                                  color: Colors.blue
                              )
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(widget.nationalCodeController,
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width / 30,
                                  color: Colors.blue
                              )
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(widget.nationalCodeSerialController,
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width / 30,
                                  color: Colors.blue
                              )
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(widget.birthdayController,
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width / 30,
                                  color: Colors.blue
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("نام",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("نام خانوادگی",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("کد ملی",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("سریال کارت ملی",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("تاریخ تولد",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 60,),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Divider(
                    thickness: 2,
                    color: Colors.black26,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 50,),
                Expanded(
                    flex: 3,
                    child: Text("اطلاعات تکمیلی متقاضی", style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.blue
                    ),)),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 20,
                  left: MediaQuery.of(context).size.width / 20,
                  top: MediaQuery.of(context).size.height / 40
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(widget.mobileNumberController,
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width / 30,
                                  color: Colors.blue
                              )
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(widget.postCodeController,
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width / 30,
                                  color: Colors.blue
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("تلفن تماس",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("کد پستی",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 6,
                    child: Text("تمامی اطلاعات فوق را خوانده ام و تایید می کنم.", style: TextStyle(
                    fontWeight: FontWeight.w700,
                        color: Colors.black
                    ),
                    textDirection: TextDirection.rtl,)),
                Expanded(
                  flex: 1,
                  child: Checkbox(
                      value: this.valueFirst,
                      onChanged:  (bool? value) {
                        setState(() {
                          this.valueFirst = value!;
                          print("qqqqqqqqqq              "+this.valueFirst.toString());
                        });
                      },),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
