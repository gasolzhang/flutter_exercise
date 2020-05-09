import 'dart:io';

/**
 *  Author:GasolZhang
 *  Date:2020-04-17
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound_player.dart';
import 'package:flutter_sound/flutter_sound_recorder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_sound/flauto.dart';

///
class SoundPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<SoundPage> {
  FlutterSoundRecorder _recorder;
  FlutterSoundPlayer _player;
  String _curState;
  String _recorderFile;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    print('开始初始化录音');
    _recorder = FlutterSoundRecorder();
    await _recorder.initialize();
//    _recorder.setDbLevelEnabled(true);
    _recorder.isEncoderSupported(t_CODEC.CODEC_AAC);
    print('录音初始化完毕');

    _player = FlutterSoundPlayer();
    await _player.initialize();
    _player.isDecoderSupported(t_CODEC.CODEC_AAC);
    print('播放器初始化完毕');

  }

  @override
  void dispose() {
    super.dispose();
    _recorder.stopRecorder();
    _recorder.release();
    _player.stopPlayer();
    _player.release();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        title: Text(
          '录音Demo页面',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(_curState ?? ''),
              RaisedButton(child: Text('开始录音'), onPressed: _startRecord),
              RaisedButton(child: Text('结束录音'), onPressed: _stopRecord),
              RaisedButton(child: Text('开始播放'), onPressed: _startPlayRecord),
              RaisedButton(child: Text('结束播放'), onPressed: _stopPlayRecord),
            ],
          ),
        ),
      ),
    );
  }

  void _startRecord() async {
    String fileName = DateTime.now().millisecond.toString();
    String fileType = '';
    if (Platform.isIOS) {
      fileType = '.m4a';
    } else {
      fileType = '.mp4';
    }

    Directory directory = await getApplicationDocumentsDirectory();
    String appPath = directory.path;

    _recorderFile = '$appPath/$fileName$fileType';
    print('录音文件路径：$_recorderFile');
    _recorder.startRecorder(uri: _recorderFile).then((value) {
      setState(() {
        _curState = '开始录音';
      });
    });
  }

  void _stopRecord() {
    _recorder.stopRecorder().then((value) {
      Fluttertoast.showToast(msg: '已停止录音');
      setState(() {
        _curState = '录音已停止';
      });
    });
  }

  void _startPlayRecord() {
    if (File(_recorderFile).existsSync()) {
      _player.setVolume(0.9);
      _player.startPlayer(_recorderFile, whenFinished: () {
        setState(() {
          _curState = '播放完毕';
        });
      }).then((value) {
        setState(() {
          _curState = '开始播放';
        });
      });
    } else {
      Fluttertoast.showToast(msg: '录音文件不存在');
    }
  }

  void _stopPlayRecord() {
    _player.stopPlayer().then((value) {
      setState(() {
        _curState = '停止播放';
      });
    });
  }
}
