import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview/network/dio_request.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ImagePickerState();
  }
}

class ImagePickerState extends State<ImagePickerPage> {
  File photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ImagePickerPage')),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            RaisedButton(child: Text('拍照'), onPressed: _takePhoto),
            RaisedButton(child: Text('选择图片'), onPressed: _selectPhoto),
            Center(child: photo == null ? Text('未选择图片') : Image.file(photo))
          ],
        ),
      ),
    );
  }

  void _takePhoto() async {
    var image =
        await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 400);
    setState(() {
      print('拍照结果：${image.path}');
      photo = image;
    });
  }

  void _selectPhoto() async {
    var image =
        await ImagePicker.pickImage(source: ImageSource.gallery, maxWidth: 400);
    setState(() {
      print('选择结果：${image.path}');
      photo = image;
    });
  }

  void _uploadFile(String filePath, String fileName) async {
    FormData formData = FormData.fromMap({
      "name": "wendux",
      "age": 25,
      "file": await MultipartFile.fromFile(filePath, filename: fileName)
    });
    var response = await Dio().post('/info', data: formData);
  }

  void _uploadFiles() {
    FormData formData = FormData.fromMap({
      "files": [
        MultipartFile.fromFileSync("./example/upload.txt",
            filename: "upload.txt"),
        MultipartFile.fromFileSync("./example/upload.txt",
            filename: "upload.txt"),
      ]
    });
    Dio().post('info', data: formData);
  }
}
