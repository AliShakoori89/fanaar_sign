import 'package:fanar_sign/component/base_appbar.dart';
import 'package:fanar_sign/page/authentication_pages/live_video/preview_page.dart';
import 'package:fanar_sign/page/authentication_pages/live_video/video_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "dart:math";
import 'package:camera/camera.dart';

class InputLiveVideo extends StatefulWidget {

  const InputLiveVideo({required this.cameras, Key? key}) : super(key: key);
  final List<CameraDescription> cameras;

  @override
  State<InputLiveVideo> createState() => _InputLiveVideoState(cameras);
}

class _InputLiveVideoState extends State<InputLiveVideo> {

  final List<CameraDescription> cameras;

  _InputLiveVideoState(this.cameras);

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
      appBar: BaseAppBar(
        title: "ارسال فیلم",
      ),
      body: Align(
        alignment: Alignment.centerRight,
        child: Container(child: Demo(cameras: cameras))
        // Container(
        //   margin: EdgeInsets.only(
        //       top: MediaQuery.of(context).size.height / 30,
        //       right: MediaQuery.of(context).size.width / 30,
        //       left: MediaQuery.of(context).size.width / 30
        //   ),
        //   child: Column(
        //     children: [
        //       SizedBox(height: MediaQuery.of(context).size.height / 30,),
        //       Text("لطفا ویدیو خود را همراه با تکرار جمله ذیل ارسال نمایید.",
        //         style: TextStyle(
        //             fontSize: MediaQuery.of(context).size.width / 24,
        //             fontWeight: FontWeight.w700
        //         ),
        //       textDirection: TextDirection.rtl,),
        //       // SizedBox(height: MediaQuery.of(context).size.height / 30,),
        //       // Text(element, textDirection: TextDirection.rtl,
        //       // style: TextStyle(color: Colors.red, fontSize: MediaQuery.of(context).size.width / 25),),
        //       // SizedBox(height: MediaQuery.of(context).size.height / 20,),
        //       // Align(
        //       //   alignment: Alignment.center,
        //       //   child: ClipRRect(
        //       //     borderRadius: BorderRadius.all(
        //       //         Radius.circular(100)),
        //       //     child: Container(
        //       //       width: 200,
        //       //       height: 300,
        //       //       decoration: BoxDecoration(
        //       //         border: Border.all(width: 2, color: Colors.black),
        //       //         borderRadius: BorderRadius.all(
        //       //             Radius.circular(100)),
        //       //       ),
        //       //       // margin: EdgeInsets.only(bottom: 30),
        //       //       // child: Square(),
        //       //     ),
        //       //   ),
        //       // ),
        //       SizedBox(height: MediaQuery.of(context).size.height / 30),
        //       Container(
        //         // width: 200,
        //         alignment: Alignment.center,
        //         // margin: EdgeInsets.all(24),
        //         // padding: EdgeInsets.all(24),
        //         decoration: BoxDecoration(),
        //         // decoration: ,
        //         child: Container(child: Demo(cameras: cameras)),
        //       ),
        //       // Container(
        //       //   margin: EdgeInsets.only(bottom: 20, right: 20),
        //       //   height: MediaQuery.of(context).size.height,
        //       //   width: MediaQuery.of(context).size.width,
        //       //   child: Stack(
        //       //     children: [
        //       //       Align(
        //       //         alignment: Alignment.bottomRight,
        //       //         child: ClipRRect(
        //       //           borderRadius: BorderRadius.all(Radius.circular(20)),
        //       //           child: Container(
        //       //             width: 200,
        //       //             height: 200,
        //       //             decoration: BoxDecoration(
        //       //               border: Border.all(width: 10, color: Colors.black),
        //       //             ),
        //       //             // margin: EdgeInsets.only(bottom: 30),
        //       //             child: Square(),
        //       //           ),
        //       //         ),
        //       //       ),
        //       //       // Square(),
        //       //     ],
        //       //   ),
        //       // )
        //     ],
        //   ),
        // ),
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
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(width: 10, color: Colors.black),
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
  _SquareState createState() => _SquareState(cameras);
}

class _SquareState extends State<Square> {

  _SquareState(this.cameras);
  late CameraController _cameraController;
  final List<CameraDescription> cameras;
  bool _isRearCameraSelected = true;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    initCamera(widget.cameras[0]);
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

  // Future takePicture() async {
  //   if (!_cameraController.value.isInitialized) {
  //     return null;
  //   }
  //   if (_cameraController.value.isTakingPicture) {
  //     return null;
  //   }
  //   try {
  //     await _cameraController.setFlashMode(FlashMode.off);
  //     XFile picture = await _cameraController.takePicture();
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => PreviewPage(
  //               picture: picture,
  //             )));
  //   } on CameraException catch (e) {
  //     debugPrint('Error occured while taking picture: $e');
  //     return null;
  //   }
  // }

  _recordVideo() async {
    if (_isRecording) {
      final file = await _cameraController.stopVideoRecording();
      setState(() => _isRecording = false);
      final route = MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => VideoPage(filePath: file.path),
      );
      Navigator.push(context, route);
    } else {
      await _cameraController.prepareForVideoRecording();
      await _cameraController.startVideoRecording();
      setState(() => _isRecording = true);
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
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  color: Colors.black),
              child:
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 30,
                      icon: Icon(
                          _isRearCameraSelected
                              ? CupertinoIcons.switch_camera
                              : CupertinoIcons.switch_camera_solid,
                          color: Colors.white),
                      onPressed: () {
                        setState(
                                () => _isRearCameraSelected = !_isRearCameraSelected);
                        initCamera(widget.cameras![_isRearCameraSelected ? 0 : 1]);
                      },
                    )),
                Expanded(
                    child: IconButton(
                      onPressed: _recordVideo,
                      iconSize: 50,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: Icon(_isRecording ? Icons.stop : Icons.circle, color: Colors.white),
                    )),
                const Spacer(),
              ]),
            )),
      ],
    );
  }
}