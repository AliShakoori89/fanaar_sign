import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class ShowModelBottomSheet extends StatefulWidget {

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

      setState(() async{
        this.image = imageTemp;
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('nationalCardImage', image.path);
        Navigator.pop(context);
      });
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  pickImageC() async {
    print('Picker is Called');
    var img = await ImagePicker().pickImage(source: ImageSource.camera);
    image = File(img!.path);
    setState(() {});
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
