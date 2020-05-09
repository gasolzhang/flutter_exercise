import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview/network/net_check.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VidioPlayerState();
  }
}

class VidioPlayerState extends State<VideoPlayerPage> {
  ChewieController chewieController;
  VideoPlayerController videoController;
  NetworkChecker checker;
  bool _autoPlay = false;

  @override
  void initState() {
    super.initState();
    _initNetChecker();
    _initController();
  }

  @override
  void dispose() {
    super.dispose();
    videoController.dispose();
    chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('视频播放页面')),
      body: Container(
        child: Column(
          children: <Widget>[
            Chewie(
              controller: chewieController,
            ),
          ],
        ),
      ),
    );
  }

  void _initNetChecker() {
    checker = NetworkChecker();
    checker.isWifi().then((value) {
      setState(() {
        _autoPlay = value;
      });
    });
  }

  void _initController() {
    videoController =
        VideoPlayerController.network('https://youtu.be/PaPUkxYHDUw');
    chewieController = ChewieController(
      videoPlayerController: videoController,
      aspectRatio: 16 / 9,
      autoPlay: _autoPlay,
      looping: true,
    );
  }
}
