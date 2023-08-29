import 'package:camera/camera.dart';
import 'package:device_preview/device_preview.dart';
import 'package:fanar_sign/bloc/certificate_store/bloc.dart';
import 'package:fanar_sign/page/home_page.dart';
import 'package:fanar_sign/repository/certificate_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final cameras =await availableCameras();
  runApp(
    DevicePreview(
      enabled: true,
      tools: [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) =>
          MyApp(cameras: cameras),
    ),
  );
}
// void main() {
//   runApp(
//       const MyApp()
//   );
// }

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.cameras});
  final List<CameraDescription> cameras;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) =>
                CertificateBloc(CertificateRepository())),
      ],
      child: MaterialApp(
        title: "Fanaar Sign",
        debugShowCheckedModeBanner: false,
        home: HomePage(cameras: cameras),
      ),
    );
  }
}
