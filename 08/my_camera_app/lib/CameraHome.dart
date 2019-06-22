import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class CameraHome extends StatefulWidget {
  @override
  _CameraHomeState createState() => _CameraHomeState();
}

class _CameraHomeState extends State<CameraHome> {
  File _image;
  Future openCamera() async{
    var image  = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      _image = image;
    });
  }

  Future openGallery() async {
    var galleryImage = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _image = galleryImage;
    });
  }

  Future<void> _optionsDialogBox() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
           backgroundColor: Colors.blueAccent,
           shape: RoundedRectangleBorder(),
           content: SingleChildScrollView(
             child: ListBody(
               children: <Widget>[
                 GestureDetector(
                   child: Text(
                     'Camera Picture',
                    style: TextStyle(
                      color: Colors.white
                    ),
                   ),
                   onTap: openCamera,
                 ),
                 Padding(
                   padding: EdgeInsets.all(10.0),
                 ),
                 GestureDetector(
                   child: Text(
                     'Open Gallery',
                    style: TextStyle(
                      color: Colors.white
                    ),
                   ),
                   onTap: openGallery,
                 )
               ],
             ),
           ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Camera App'),
      ),
      body: Center(
        child: _image == null ? Text('No Image') : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _optionsDialogBox,
        child: Icon(Icons.add_a_photo),
        tooltip: 'Open A Camera',
      ),
    );
  }
}