import 'dart:io';
import 'package:camera/camera.dart';
import 'package:fanar_sign/component/main_page_header.dart';
import 'package:flutter/material.dart';
import '../component/main_page_footer.dart';

class HomePage extends StatefulWidget {

  final List<CameraDescription> cameras;

  HomePage({super.key, required this.cameras});

  @override
  State<HomePage> createState() => _HomePageState(cameras);
}

class _HomePageState extends State<HomePage> {

  var selectedIndex = 2;
  final List<CameraDescription> cameras;

  _HomePageState(this.cameras);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image/fanaar background image.png"),
                  fit: BoxFit.fill,
                  opacity: 0.05)
          ),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                  child: MainPageHeader(mainPage: true)),
              Expanded(
                  flex: 12,
                  child: MainPageFooter(cameras: cameras))
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Directionality(
            textDirection: TextDirection.rtl,
            child: Text('مطمئن هستید؟')),
        content: const Directionality(
            textDirection: TextDirection.rtl,
            child: Text('آیا می خواهید از برنامه خارج شوید.')),
        actions: <Widget>[
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('خیر'),
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextButton(
              onPressed: () => exit(0),
              child: const Text('بله'),
            ),
          ),
        ],
      ),
    )) ?? false;
  }
}
