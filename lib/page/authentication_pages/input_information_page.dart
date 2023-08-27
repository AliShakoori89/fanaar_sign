import 'package:camera/camera.dart';
import 'package:fanar_sign/bloc/certificate_store/event.dart';
import 'package:fanar_sign/component/base_appbar.dart';
import 'package:fanar_sign/component/datetime_picker_textfield.dart';
import 'package:fanar_sign/component/my_app_button.dart';
import 'package:fanar_sign/component/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/certificate_store/bloc.dart';
import '../../bloc/certificate_store/state.dart';
import '../../component/background_image.dart';
import '../../component/costom_snackbar.dart';
import '../../component/custom_drop_down_button.dart';

class InputInformationPage extends StatefulWidget {

  InputInformationPage({super.key, this.index, required this.cameras});
  int? index;
  final List<CameraDescription> cameras;

  @override
  State<InputInformationPage> createState() => _InputInformationPageState(index, cameras);
}

class _InputInformationPageState extends State<InputInformationPage> {

  late TextEditingController nationalCodeController = TextEditingController();
  late TextEditingController mobileNumberController = TextEditingController();
  late TextEditingController birthdayController = TextEditingController();
  late TextEditingController nationalCodeSerialController = TextEditingController();
  late TextEditingController postCodeController = TextEditingController();
  final List<CameraDescription> cameras;

  final formKey = GlobalKey<FormState>();
  int? index;

  _InputInformationPageState(this.index, this.cameras);

  @override
  void initState() {
    final certificateBloc = BlocProvider.of<CertificateBloc>(context);
    certificateBloc.add(ExistCertificateEvent(nationalCode: nationalCodeController.text, selectProduceName: CustomDropDownButtonState.selectProduceName!));
    super.initState();
  }

  @override
  void dispose() {
    nationalCodeController.dispose();
    mobileNumberController.dispose();
    birthdayController.dispose();
    nationalCodeSerialController.dispose();
    postCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CertificateBloc, CertificateState>(builder: (context, state){
      return Scaffold(
      appBar: BaseAppBar(title: 'مشخصات متقاضی'),
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
      // state.existCertificate == true
          // ?
      MyAppButton(
          nationalCodeController: nationalCodeController.text,
          mobileNumberController: mobileNumberController.text,
          birthdayController: birthdayController.text,
          nationalCodeSerialController: nationalCodeSerialController.text,
          postCodeController: postCodeController.text,
          cameras: cameras,
          pageName: "InputInformationPage",
          formKey: formKey,
          index : index),
          // : CustomWidgets.buildErrorSnackbar(context,"برای این کد ملی قبلا گواهی صادر شده است."),
      body: Container(
        decoration: baseBackgroundDecoration,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 5,),
              Container(
                margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 20, right: MediaQuery.of(context).size.width / 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyTextField(
                        hintText: "کد ملی",
                        labelText: "کد ملی",
                        controller: nationalCodeController),
                    SizedBox(height: MediaQuery.of(context).size.height / 50),
                    MyTextField(
                        hintText: "شماره موبایل",
                        labelText: "شماره موبایل",
                        controller: mobileNumberController
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 50),
                    DateTimePickerTextField(
                        hintText: "تاریخ تولد",
                        labelText: "تاریخ تولد",
                        controller: birthdayController
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 25),
                    MyTextField(
                        hintText: "سریال کارت ملی",
                        labelText: "سریال کارت ملی",
                        controller: nationalCodeSerialController
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 50),
                    MyTextField(
                        hintText: "کد پستی",
                        labelText: "کد پستی",
                        controller: postCodeController
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );});;
  }
}
