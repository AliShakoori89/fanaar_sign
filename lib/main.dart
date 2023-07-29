import 'package:camera/camera.dart';
import 'package:device_preview/device_preview.dart';
import 'package:fanar_sign/page/authentication_pages/input_documents_images.dart';
import 'package:fanar_sign/page/authentication_pages/live_video/input_live_video.dart';
import 'package:fanar_sign/page/authorization_page.dart';
import 'package:fanar_sign/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final cameras =await availableCameras();
  runApp(
    DevicePreview(
      enabled: true,
      tools: [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => MyApp(cameras: cameras),
    ),
  );
}
// void main() {
//   runApp(
//       const MyApp()
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.cameras});
  final List<CameraDescription> cameras;


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
      home: InputLiveVideo(cameras: cameras),
    );
  }
}
