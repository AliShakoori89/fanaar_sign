import 'package:fanar_sign/page/authorization_page.dart';
import 'package:fanar_sign/page/home_page.dart';
import 'package:fanar_sign/page/navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthorizationPage(),
    );
  }
}
