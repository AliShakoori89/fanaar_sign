import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../component/base_appbar.dart';
import 'package:intl/intl.dart' as init;
import '../../../component/my_app_button.dart';
import '../bloc/certificate_store/bloc.dart';
import '../bloc/certificate_store/event.dart';
import '../component/custom_drop_down_button.dart';
import '../const/app_color.dart';
import '../model/certificate_model.dart';
import 'home_page.dart';

class IssuedCertificatePage extends StatefulWidget {

  final String nationalCodeController;
  final String mobileNumberController;
  final String birthdayController;
  final String nationalCodeSerialController;
  final String postCodeController;
  final List<CameraDescription> cameras;

  const IssuedCertificatePage({super.key, required this.nationalCodeController,
    required this.mobileNumberController, required this.birthdayController,
    required this.nationalCodeSerialController, required this.postCodeController,
    required this.cameras});

  @override
  State<IssuedCertificatePage> createState() => _IssuedCertificatePageState(nationalCodeController,
      mobileNumberController, birthdayController, nationalCodeSerialController, postCodeController ,cameras);
}

class _IssuedCertificatePageState extends State<IssuedCertificatePage> {

  _IssuedCertificatePageState(this.nationalCodeController, this.mobileNumberController, this.birthdayController,
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
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
          onTap: (){
            late CertificateDetailsModel certificate = CertificateDetailsModel();
            final setDateBloc = BlocProvider.of<CertificateBloc>(context);

            DateTime issuedDate = DateTime.now();
            final f = new init.DateFormat('yyyy-MM-dd');
            
            DateTime expireDate = DateTime(issuedDate.year+1 , issuedDate.month, issuedDate.day);

            certificate.certificateIssuerInterMediateCAName = CustomDropDownButtonState.selectIntermediateCAName;
            certificate.selectProduceName = CustomDropDownButtonState.selectProduceName;
            certificate.certificateSerialCode = nationalCodeController;
            certificate.certificateExpirationDate = f.format(issuedDate);
            certificate.certificateIssuedDate = f.format(expireDate);
            
            setDateBloc.add(SaveCertificateToStoreEvent(certificateModel: certificate));

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage(cameras: cameras)),
            );
          },
          child: Container(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 20,
                right: MediaQuery.of(context).size.width / 20),
            height: MediaQuery.of(context).size.height / 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: AppColors.mainColor,
              ),
            ),
            child: Center(
              child: Text("صدور گواهی",
                  style: TextStyle(color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width / 20)),
            ),
          )
      ),
      appBar: BaseAppBar(
        title: "صدور گواهینامه الکترونیکی",
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image/fanaar background image.png"),
                fit: BoxFit.fill,
                opacity: 0.15)
        ),
        child: Container(
          margin: EdgeInsets.only(
              right: 10,
              left: 20,
              top: 10,
              bottom: 10
          ),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 30,),
              Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text("مراحل ثبت نام و تصدیق هویت شما، با موفقیت پایان یافته است. اکنون می توانید"
                      " برای دریافت گواهی نامه، بر روی گزینه صدور گواهی کلیک کنید.",
                      textAlign:TextAlign.justify,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 22,
                          fontWeight: FontWeight.w700
                      )
                  )
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 10,),
              Image.asset("assets/image/issued image.png",
              fit: BoxFit.fitWidth,)
            ],
          ),
        ),
      ),
    );
  }
}
