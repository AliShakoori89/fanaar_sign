import 'package:fanar_sign/component/base_appbar.dart';
import 'package:fanar_sign/component/my_app_button.dart';
import 'package:fanar_sign/page/authentication_pages/live_video/preview_video_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "dart:math";
import 'package:camera/camera.dart';


class InputLiveVideo extends StatefulWidget {

  const InputLiveVideo({super.key, required this.nationalCodeController,
    required this.mobileNumberController, required this.birthdayController,
    required this.nationalCodeSerialController, required this.postCodeController, required this.cameras});

  final List<CameraDescription> cameras;
  final String nationalCodeController;
  final String mobileNumberController;
  final String birthdayController;
  final String nationalCodeSerialController;
  final String postCodeController;

  @override
  State<InputLiveVideo> createState() => _InputLiveVideoState(nationalCodeController,
      mobileNumberController, birthdayController, nationalCodeSerialController, postCodeController ,cameras);
}

class _InputLiveVideoState extends State<InputLiveVideo> {

  final List<CameraDescription> cameras;
  final String nationalCodeController;
  final String mobileNumberController;
  final String birthdayController;
  final String nationalCodeSerialController;
  final String postCodeController;

  _InputLiveVideoState(this.nationalCodeController, this.mobileNumberController, this.birthdayController,
      this.nationalCodeSerialController, this.postCodeController, this.cameras);

  var list = [
    'میوه های درخت سیب رسیده است.',
    'پاییز فصل برگریزان درختان میباشد.',
    'پایتخت ایران، تهران است.',
    'فشار خون بالا برای بدن مضر است.',
    'سیگار عامل اصلی سرطان است.'];

  final _random = new Random();
  late Future<void> cameraValue;

  @override
  Widget build(BuildContext context) {

    var element = list[_random.nextInt(list.length)];

    return Scaffold(
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MyAppButton(
          nationalCodeController: nationalCodeController,
          mobileNumberController: mobileNumberController,
          birthdayController: birthdayController,
          nationalCodeSerialController: nationalCodeSerialController,
          postCodeController: postCodeController,
          cameras: cameras,
          isRecord: SquareState.isRecord,
          pageName: "InputLiveVideo"
      ),
      appBar: BaseAppBar(
        title: "ارسال فیلم",
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image/fanaar background image.png"),
                fit: BoxFit.fill,
                opacity: 0.15)
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 30,),
            Text("لطفا ویدیو خود را همراه با تکرار جمله ذیل ارسال نمایید.",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 24,
                  fontWeight: FontWeight.w700
              ),
            textDirection: TextDirection.rtl,),
            SizedBox(height: MediaQuery.of(context).size.height / 30,),
            Text(element, textDirection: TextDirection.rtl,
            style: TextStyle(color: Colors.red, fontSize: MediaQuery.of(context).size.width / 25,
                fontWeight: FontWeight.w700),),
            SizedBox(height: MediaQuery.of(context).size.height / 20,),
            Align(
              alignment: Alignment.centerRight,
              child: Container(child: Demo(cameras: cameras))
            ),
          ],
        ),
      ),
    );
  }
}

class Demo extends StatelessWidget {

  final List<CameraDescription> cameras;

  Demo({required this.cameras, Key? key});

  build(context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, right: 20),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              child: Container(
                width: MediaQuery.of(context).size.width / 2.1,
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                  // border: Border.all(width: 2, color: Colors.black),
                  borderRadius: BorderRadius.circular(100)
                ),
                // margin: EdgeInsets.only(bottom: 30),
                child: Square(cameras: cameras),
              ),
            ),
          ),
          // Square(),
        ],
      ),
    );
  }
}

class Square extends StatefulWidget {
  final color;
  final size;
  final List<CameraDescription> cameras;

  Square({this.color, this.size, required this.cameras});

  @override
  SquareState createState() => SquareState(cameras);
}

class SquareState extends State<Square> {

  SquareState(this.cameras);
  late CameraController _cameraController;
  final List<CameraDescription> cameras;
  bool _isRearCameraSelected = true;
  bool isRecording = false;
  static bool isRecord = false;

  @override
  void initState() {
    super.initState();
    initCamera(widget.cameras[1]);
  }

  Future initCamera(CameraDescription cameraDescription) async {
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  _recordVideo() async {
    if (isRecording) {
      final file = await _cameraController.stopVideoRecording();
      setState(() => isRecording = false);
      final route = MaterialPageRoute(
        // fullscreenDialog: true,
        builder: (_) => PreviewVideoPage(filePath: file.path),
      );
      isRecord = true;
      Navigator.push(context, route);
    } else {
      await _cameraController.prepareForVideoRecording();
      await _cameraController.startVideoRecording();
      setState(() => isRecording = true);
      isRecord = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        (_cameraController.value.isInitialized)
        ? CameraPreview(_cameraController)
        : Container(
            color: Colors.black,
            child: const Center(child: CircularProgressIndicator())),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  color: Colors.black),
              child: Container(
                margin: EdgeInsets.only(
                  left: 30,
                  right: 30
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: IconButton(
                        iconSize: MediaQuery.of(context).size.width / 30,
                        icon: Icon(
                            _isRearCameraSelected
                                ? CupertinoIcons.switch_camera
                                : CupertinoIcons.switch_camera_solid,
                            color: Colors.white,
                          size: MediaQuery.of(context).size.width / 30,),
                        onPressed: () {
                          setState(() =>
                              _isRearCameraSelected = !_isRearCameraSelected);
                          initCamera(
                              widget.cameras[_isRearCameraSelected ? 0 : 1]);
                        },
                      )),
                      Expanded(
                          child: IconButton(
                        onPressed: _recordVideo,
                        iconSize: MediaQuery.of(context).size.width / 25,
                        constraints: const BoxConstraints(),
                        icon: Icon(isRecording ? Icons.stop : Icons.not_started_outlined,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width / 25),
                      )),
                      const Spacer(),
                    ]),
              ),
            )),
      ],
    );
  }
}