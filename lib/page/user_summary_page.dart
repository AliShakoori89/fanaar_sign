import 'package:camera/camera.dart';
import 'package:fanar_sign/bloc/certificate_store/bloc.dart';
import 'package:fanar_sign/component/custom_drop_down_button.dart';
import 'package:fanar_sign/model/certificate_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as init;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../bloc/certificate_store/event.dart';
import '../component/background_image.dart';
import '../component/base_appbar.dart';
import '../component/my_app_button.dart';
import '../const/app_color.dart';
import 'home_page.dart';

class UserSummaryPage extends StatefulWidget {

  final String nationalCodeController;
  final String mobileNumberController;
  final String birthdayController;
  final String nationalCodeSerialController;
  final String postCodeController;
  final List<CameraDescription> cameras;

  UserSummaryPage({super.key, required this.nationalCodeController,
    required this.mobileNumberController, required this.birthdayController,
    required this.nationalCodeSerialController, required this.postCodeController,
    required this.cameras});

  @override
  State<UserSummaryPage> createState() => _UserSummaryPageState(nationalCodeController,
      mobileNumberController, birthdayController, nationalCodeSerialController,
      postCodeController ,cameras);
}

class _UserSummaryPageState extends State<UserSummaryPage> {

  _UserSummaryPageState(this.nationalCodeController, this.mobileNumberController, this.birthdayController,
      this.nationalCodeSerialController, this.postCodeController, this.cameras);

  final String nationalCodeController;
  final String mobileNumberController;
  final String birthdayController;
  final String nationalCodeSerialController;
  final String postCodeController;
  final List<CameraDescription> cameras;
  bool valueFirst = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "مشخصات متقاضی",
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MyAppButton(
          nationalCodeController: nationalCodeController,
          mobileNumberController: mobileNumberController,
          birthdayController: birthdayController,
          nationalCodeSerialController: nationalCodeSerialController,
          postCodeController: postCodeController,
          cameras: cameras,
          pageName: "UserSummaryPage"
      ),
      body: Container(
        height: double.infinity,
        decoration: baseBackgroundDecoration,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 30,
                left: MediaQuery.of(context).size.width / 30,
                right: MediaQuery.of(context).size.width / 30),
            child: Column(
              children: [
                Text("تایید و ثبت مشخصات", style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: MediaQuery.of(context).size.width / 20
                )),
                SizedBox(height: MediaQuery.of(context).size.height / 60,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Divider(
                      thickness: 1,
                      color: Colors.black12,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 50,),
                    Text("مشخصات محصول", style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.blue,
                        fontSize: MediaQuery.of(context).size.width / 22
                    ),),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(CustomDropDownButtonState.selectIntermediateCAName!,
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width / 25,
                                  color: Colors.blue
                              )),
                          SizedBox(height: MediaQuery.of(context).size.height / 50,),
                          Text(CustomDropDownButtonState.selectProduceName!,
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width / 25,
                                  color: Colors.blue
                              ))
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("نام مرکز میانی صادر کننده",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                              fontSize: MediaQuery.of(context).size.width / 25
                          )),
                          SizedBox(height: MediaQuery.of(context).size.height / 50,),
                          Text("نام محصول",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: MediaQuery.of(context).size.width / 25
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Divider(
                      thickness: 1,
                      color: Colors.black12,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 50,),
                    Text("اطلاعات هویتی متقاضی", style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.blue,
                        fontSize: MediaQuery.of(context).size.width / 22
                    ),)
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.nationalCodeController,
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width / 25,
                                    color: Colors.blue
                                )
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height / 40,),
                            Text(widget.nationalCodeSerialController,
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width / 25,
                                    color: Colors.blue
                                )
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height / 40,),
                            Text(widget.birthdayController,
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width / 25,
                                    color: Colors.blue
                                )
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("کد ملی",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: MediaQuery.of(context).size.width / 25
                                )),
                            SizedBox(height: MediaQuery.of(context).size.height / 50,),
                            Text("سریال کارت ملی",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: MediaQuery.of(context).size.width / 25
                                )),
                            SizedBox(height: MediaQuery.of(context).size.height / 50,),
                            Text("تاریخ تولد",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: MediaQuery.of(context).size.width / 25
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Divider(
                      thickness: 1,
                      color: Colors.black12,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 50,),
                    Text("اطلاعات تکمیلی متقاضی", style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.blue,
                        fontSize: MediaQuery.of(context).size.width / 22
                    ),),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.mobileNumberController,
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width / 25,
                                    color: Colors.blue
                                )
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height / 50,),
                            Text(widget.postCodeController,
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width / 25,
                                    color: Colors.blue
                                )
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("تلفن تماس",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: MediaQuery.of(context).size.width / 25
                                )),
                            SizedBox(height: MediaQuery.of(context).size.height / 50,),
                            Text("کد پستی",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: MediaQuery.of(context).size.width / 25
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("تمامی اطلاعات فوق را خوانده ام و تایید می کنم.", style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.width / 25,
                      fontWeight: FontWeight.w700,
                    ),
                      textDirection: TextDirection.rtl,),
                    SizedBox(width: MediaQuery.of(context).size.width / 100,),
                    Transform.scale(
                      scale: MediaQuery.of(context).size.width / 400,
                      child: Checkbox(
                        value: this.valueFirst,
                        onChanged:  (bool? value) {
                          setState(() {
                            this.valueFirst = value!;
                          });
                        },),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
