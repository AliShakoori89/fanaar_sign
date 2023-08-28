import 'package:camera/camera.dart';
import 'package:fanar_sign/component/base_appbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../component/background_image.dart';
import '../../component/my_app_button.dart';

class InputDocumentsImagesPage extends StatefulWidget {

  final String nationalCodeController;
  final String mobileNumberController;
  final String birthdayController;
  final String nationalCodeSerialController;
  final String postCodeController;
  final String selectedIntermediateCaItemsValue;
  final String selectedCertificateItemsValue;
  final List<CameraDescription> cameras;

  InputDocumentsImagesPage({super.key, required this.nationalCodeController,
  required this.mobileNumberController, required this.birthdayController,
  required this.nationalCodeSerialController, required this.postCodeController,
  required this.selectedIntermediateCaItemsValue, required this.selectedCertificateItemsValue
    , required this.cameras});

  @override
  State<InputDocumentsImagesPage> createState() => _InputDocumentsImagesPageState(nationalCodeController,
  mobileNumberController, birthdayController, nationalCodeSerialController, postCodeController ,
      selectedIntermediateCaItemsValue, selectedCertificateItemsValue, cameras);
}

class _InputDocumentsImagesPageState extends State<InputDocumentsImagesPage> {

  File? cameraImage;
  File? galleryImage;
  File? nationalCard;
  File? behindNationalCard;
  bool existImage1 = false;
  bool existImage2 = false;
  final formKey = GlobalKey<FormState>();

  final String nationalCodeController;
  final String mobileNumberController;
  final String birthdayController;
  final String nationalCodeSerialController;
  final String postCodeController;
  final String selectedIntermediateCaItemsValue;
  final String selectedCertificateItemsValue;
  final List<CameraDescription> cameras;

  _InputDocumentsImagesPageState(this.nationalCodeController, this.mobileNumberController, this.birthdayController,
      this.nationalCodeSerialController, this.postCodeController, this.selectedIntermediateCaItemsValue
      , this.selectedCertificateItemsValue, this.cameras);

  cameraConnectFromNationalCode() async {
    var img = await ImagePicker().pickImage(source: ImageSource.camera);
    nationalCard = File(img!.path);
    existImage1 = true;
    Navigator.pop(context);
    setState(() {});
  }

  galleryConnectFromNationalCode() async {
    var img = await ImagePicker().pickImage(source: ImageSource.gallery);
    nationalCard = File(img!.path);
    existImage1 = true;
    Navigator.pop(context);
    setState(() {});
  }

  cameraConnectFromBehindNationalCode() async {
    var img = await ImagePicker().pickImage(source: ImageSource.camera);
    behindNationalCard = File(img!.path);
    existImage2 = true;
    Navigator.pop(context);
    setState(() {});

  }

  galleryConnectFromBehindNationalCode() async {
    var img = await ImagePicker().pickImage(source: ImageSource.gallery);
    behindNationalCard = File(img!.path);
    existImage2 = true;
    Navigator.pop(context);
    setState(() {});

  }

  void _showDialogForNationalCode(){
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only( // <-- SEE HERE
            topLeft: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            child: Container(
              margin: EdgeInsets.only(
                  right: 10,
                  left: 20,
                  top: 10,
                  bottom: 10
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: cameraConnectFromNationalCode,
                        child: Row(
                          children: [
                            Icon(Icons.camera,
                            size: MediaQuery.of(context).size.width / 20),
                            SizedBox(width: MediaQuery.of(context).size.width / 20),
                            Text("دوربین", style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width / 20,
                                color: Colors.black
                            ))
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: galleryConnectFromNationalCode,
                        child: Row(
                          children: [
                            Icon(Icons.image,
                                size: MediaQuery.of(context).size.width / 20),
                            SizedBox(width: MediaQuery.of(context).size.width / 20),
                            Text("گالری", style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width / 20,
                                color: Colors.black
                            ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _showDialogForBehindNationalCode(){
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only( // <-- SEE HERE
            topLeft: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            child: Container(
              margin: EdgeInsets.only(
                  right: 10,
                  left: 20,
                  top: 10,
                  bottom: 10
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: cameraConnectFromBehindNationalCode,
                        child: Row(
                          children: [
                            Icon(Icons.camera,
                                size: MediaQuery.of(context).size.width / 20),
                            SizedBox(width: MediaQuery.of(context).size.width / 20),
                            Text("دوربین", style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width / 20,
                                color: Colors.black
                            ))
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: galleryConnectFromBehindNationalCode,
                        child: Row(
                          children: [
                            Icon(Icons.image,
                                size: MediaQuery.of(context).size.width / 20),
                            SizedBox(width: MediaQuery.of(context).size.width / 20),
                            Text("گالری", style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width / 20,
                                color: Colors.black
                            ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MyAppButton(
        pageName: "InputDocumentsImagesPage",
        formKey: formKey,
        existImage1: existImage1,
        existImage2: existImage2,
        nationalCodeController: nationalCodeController,
        mobileNumberController: mobileNumberController,
        birthdayController: birthdayController,
        nationalCodeSerialController: nationalCodeSerialController,
        postCodeController: postCodeController,
        selectIntermediateCAName: selectedIntermediateCaItemsValue,
        selectProduceName: selectedCertificateItemsValue,
        cameras: cameras,
      ),
      appBar: BaseAppBar(
        title: "تصویر مدارک متقاضی",
      ),
      body: Container(
        decoration: baseBackgroundDecoration,
        child: Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 30,
              right: MediaQuery.of(context).size.width / 30,
              left: MediaQuery.of(context).size.width / 30
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Text("لطفا عکس کارت ملی خود را آپلود نمایید.",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 25,
                        fontWeight: FontWeight.w700
                    ),),
                ),
                Expanded(
                    flex: 8,
                    child: Container(
                      margin: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 50,
                          left: MediaQuery.of(context).size.width / 50,
                          top: MediaQuery.of(context).size.height / 100,
                          bottom: MediaQuery.of(context).size.height / 50
                      ),
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(color: Color.fromRGBO(139, 139, 139, 0.4),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(
                              0.0, // Move to right 5  horizontally
                              5.0, // Move to bottom 5 Vertically
                            ),),
                        ],
                      ),
                      child: nationalCard == null
                          ? Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/image/image not found.png"),
                              fit: BoxFit.fill
                            ),
                            boxShadow: const [
                              BoxShadow(color: Color.fromRGBO(139, 139, 139, 0.4),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: Offset(
                                  0.0, // Move to right 5  horizontally
                                  5.0, // Move to bottom 5 Vertically
                                ),),
                            ],
                          )
                      )
                          : Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(nationalCard!),
                                fit: BoxFit.fill
                            ),
                            boxShadow: const [
                              BoxShadow(color: Color.fromRGBO(139, 139, 139, 0.4),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: Offset(
                                  0.0, // Move to right 5  horizontally
                                  5.0, // Move to bottom 5 Vertically
                                ),),
                            ],
                          )
                      )
                    )
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue)
                        ),
                        onPressed: (){
                          _showDialogForNationalCode();
                        },
                        child: Text('آپلود عکس',
                          style: TextStyle(
                              color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width / 27
                          ),)),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 50,),
                Expanded(
                  flex: 1,
                  child: Text("لطفا عکس پشت کارت ملی خود را آپلود نمایید.",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 25,
                        fontWeight: FontWeight.w700
                    ),),
                ),
                Expanded(
                    flex: 8,
                    child: Container(
                      margin: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 50,
                          left: MediaQuery.of(context).size.width / 50,
                          top: MediaQuery.of(context).size.height / 100,
                          bottom: MediaQuery.of(context).size.height / 50
                      ),
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(color: Color.fromRGBO(139, 139, 139, 0.4),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(
                              0.0, // Move to right 5  horizontally
                              5.0, // Move to bottom 5 Vertically
                            ),),
                        ],
                      ),
                      child: behindNationalCard == null
                          ? Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/image/image not found.png"),
                                fit: BoxFit.fill
                            ),
                            boxShadow: const [
                              BoxShadow(color: Color.fromRGBO(139, 139, 139, 0.4),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: Offset(
                                  0.0, // Move to right 5  horizontally
                                  5.0, // Move to bottom 5 Vertically
                                ),),
                            ],
                          )
                      )
                          : Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(behindNationalCard!),
                                fit: BoxFit.fill
                            ),
                            boxShadow: const [
                              BoxShadow(color: Color.fromRGBO(139, 139, 139, 0.4),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: Offset(
                                  0.0, // Move to right 5  horizontally
                                  5.0, // Move to bottom 5 Vertically
                                ),),
                            ],
                          )
                      )
                    ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue)
                        ),
                        onPressed: (){
                          _showDialogForBehindNationalCode();
                        },
                        child: Text('آپلود عکس',
                          style: TextStyle(
                              color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width / 27
                          ),)),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 8,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
