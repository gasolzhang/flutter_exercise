import 'dart:io';

import 'package:camera/camera.dart';
/**
 *  Author:GasolZhang
 *  Date:2020-04-04
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;

///
class TakePicturePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<TakePicturePage> {
  bool isRecordingVideo = false;
  String videoPath = '';

  CameraController _controller;
  bool _prepared = false;

  @override
  void initState() {
    super.initState();
    availableCameras().then((value) {
      _controller = CameraController(value.first, ResolutionPreset.medium);
      _controller.initialize().then((value) {
        setState(() {
          _prepared = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: _prepared
          ? Stack(
              children: <Widget>[
                ClipRect(
                    child: Transform.scale(
                  scale: _controller.value.aspectRatio / size.aspectRatio,
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: CameraPreview(_controller),
                    ),
                  ),
                )),
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: IconButton(
                    onPressed: ()  => _takePhoto(),
                    iconSize: 48,
                    icon: Icon(Icons.camera, color: Colors.grey),
                  ),
                ),
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  void _takePhoto() async {
    String path = (await getTemporaryDirectory()).path;
    path += '${DateTime.now()}.png';
    print('照片名称：$path}');
    await _controller.takePicture(path);

    //保存图片到相册
    await GallerySaver.saveImage(path);
    Navigator.pushNamed(context, '/pre_picture', arguments: path);
  }

  void _recordVideo() async {
    String path = (await getTemporaryDirectory()).path;
    if (!isRecordingVideo) {
      path += '${DateTime.now()}.mp4';
      videoPath = path;
      _controller.startVideoRecording(path);
      Fluttertoast.showToast(msg: '开始录制视频');
      isRecordingVideo = !isRecordingVideo;
    } else {
      _controller.stopVideoRecording().then((value) {
        isRecordingVideo = !isRecordingVideo;
        GallerySaver.saveVideo(videoPath)
            .then((value) {
          Fluttertoast.showToast(msg: '视频保存完毕');
          Navigator.pop(context);
        });
      });
    }
  }
}

// A widget that displays the picture taken by the user.
class PrePicturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String imagePath = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      body: Image.file(File(imagePath)),
    );
  }
}
