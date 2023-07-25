import 'package:fanar_sign/component/main_page_header.dart';
import 'package:fanar_sign/page/authentication_pages/input_information_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({Key? key}) : super(key: key);

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {

  final auth = LocalAuthentication();
  String authorized = " not authorized";

  Future<void> _checkBiometric() async {

    try {
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;

    setState(() {
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;

    try {
      authenticated = await auth.authenticate(
          localizedReason: "لطفا از اثر انگشت برای ورود به اپلیکیشن استفاده نمایید.",
      authMessages: <AuthMessages>[AndroidAuthMessages(
        biometricRequiredTitle: "نیاز به احراز هویت",
        signInTitle: "احراز هویت",
        biometricHint: "",
      ),],
      );
    } on PlatformException catch (e) {
      print(e);
    }

    setState(() {
      authorized =
      authenticated ? "Authorized success" : "Failed to authenticate";
    });

    if(authorized == "Authorized success"){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InputInformationPage()));
    }
  }

  Future _getAvailableBiometric() async {
    List<BiometricType> availableBiometric = [];

    try {
      availableBiometric = await auth.getAvailableBiometrics();
      print("availableBiometric       "+availableBiometric.toString());
      ;
    } on PlatformException catch (e) {
      print(e);
    }

    setState(() {
    });
  }

  @override
  void initState() {
    _checkBiometric();
    _getAvailableBiometric();
    _authenticate();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MainPageHeader(mainPage: false,),
          Spacer(),
          Directionality(
              textDirection: TextDirection.rtl,
              child: Text("لطفا برای اخراز هویت آیکون زیر زا بفشارید.",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 25,
                fontWeight: FontWeight.w700
              ),)),
          SizedBox(height: MediaQuery.of(context).size.height / 20,),
          GestureDetector(
            onTap: (){
              _checkBiometric();
              _getAvailableBiometric();

              _authenticate();
            },
            child: Icon(Icons.fingerprint,
              size: MediaQuery.of(context).size.width / 6,),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
          )
        ],
      )
    );
  }
}
