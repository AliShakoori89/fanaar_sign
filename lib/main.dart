import 'package:device_preview/device_preview.dart';
import 'package:fanar_sign/page/authentication_page.dart';
import 'package:fanar_sign/page/authorization_page.dart';
import 'package:fanar_sign/page/certificate_managment_page.dart';
import 'package:fanar_sign/page/home_page.dart';
import 'package:fanar_sign/page/issued_new_certificate_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      tools: [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MyApp(),
    ),
  );
}
// void main() {
//   runApp(
//       const MyApp()
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: "Fanaar Sign",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
