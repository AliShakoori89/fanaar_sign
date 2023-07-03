import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'authentication_page.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({Key? key}) : super(key: key);

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {

  final LocalAuthentication auth = LocalAuthentication();
  bool authenticated = false;

  Future<void> _authenticateWithBiometrics() async {

    try {
      authenticated = await auth.authenticate(
        localizedReason:
        'لطفا برای احراز هویت از اثر انگشت استفاده نمایید.',
        authMessages: <AuthMessages>[
          const AndroidAuthMessages(
            signInTitle: 'احراز هویت',
            cancelButton: 'No thanks',
            biometricHint: "",
          ),
        ],
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: false,
          useErrorDialogs: true,
        ),
      );
    } on PlatformException catch (e) {
      return;
    }
    if (!mounted) {
      return;
    }

    if(authenticated == true){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AuthenticationPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _authenticateWithBiometrics,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              duration: const Duration(milliseconds: 3000),
              curve: Curves.bounceOut,
              tween: Tween(begin: 1.0, end: 0.0),
              builder: (context, value, child){
                // horizontal disposition of the widget.
                return Transform.translate(
                  offset:  Offset(
                      value * 500,
                      0.0
                  ),
                  child: child,
                );
              },
              child: Image.asset("assets/logo/fanaar logo.png"),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 5,),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text("لطفا برای وارد شدن به برنامه بر روی اثر انگشت بزنید.",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 25,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Center(
              child: Icon(
                  Icons.fingerprint,
                  size: MediaQuery.of(context).size.width / 6,
                  color: Colors.grey,),
            ),
          ],
        ),
      ),
    );
  }
}
