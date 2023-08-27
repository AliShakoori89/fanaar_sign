import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../component/background_image.dart';

class PreviewVideoPage extends StatefulWidget {
  final String filePath;

  const PreviewVideoPage({Key? key, required this.filePath}) : super(key: key);

  @override
  _PreviewVideoPageState createState() => _PreviewVideoPageState();
}

class _PreviewVideoPageState extends State<PreviewVideoPage> {
  late VideoPlayerController _videoPlayerController;

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future _initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.file(File(widget.filePath));
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    await _videoPlayerController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.black, Colors.blue]),
          ),
        ),
        actions: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                  right: 10
              ),
              child: Text('پیش نمایش',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 20,
                      color: Colors.white
                  )),
            ),
          )
        ],
        leading: IconButton(
          icon: const Icon(Icons.check),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: baseBackgroundDecoration,
        child: FutureBuilder(
          future: _initVideoPlayer(),
          builder: (context, state) {
            if (state.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Center(
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
                    child: VideoPlayer(_videoPlayerController),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}