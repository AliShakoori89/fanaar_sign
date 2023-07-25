import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ShowModelBottomSheet extends StatefulWidget {
  ShowModelBottomSheet({super.key});

  @override
  State<ShowModelBottomSheet> createState() => _ShowModelBottomSheetState();
}

class _ShowModelBottomSheetState extends State<ShowModelBottomSheet> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if(image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if(image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Container(
        margin: EdgeInsets.only(
            left: 10,
            right: 10
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: (){
                  pickImage();
                },
                child: Container(
                  width: double.infinity,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("گالری", style: TextStyle(fontWeight: FontWeight.w700),),
                      SizedBox(width: MediaQuery.of(context).size.width / 10,),
                      Icon(Icons.camera, size: 25),
                    ],
                  ),
                ),
              ),
            ),
            Divider(height: .5, color: Colors.grey,),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: (){
                  pickImageC();
                },
                child: Container(
                  width: double.infinity,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("دوربین", style: TextStyle(fontWeight: FontWeight.w700)),
                      SizedBox(width: MediaQuery.of(context).size.width / 10,),
                      Icon(Icons.browse_gallery, size: 25),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
