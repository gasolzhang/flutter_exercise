import 'dart:isolate';

/**
 *  Author:GasolZhang
 *  Date:2020-04-14
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///
class IsolatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<IsolatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: CircularProgressIndicator(),
            ),
            RaisedButton(
              onPressed: computeText,
              child: Text('执行compute'),
            ),
            RaisedButton(
              onPressed: startIsolate,
              child: Text('执行isolate'),
            )
          ],
        ),
      ),
    );
  }

  void computeText() async {
    String resp = await compute(testCompute, Bean(100000));
    print('compute返回结果=$resp');
  }

  static String testCompute(Bean bean) {
    for (int i = 0; i < bean.count; i++) {}
    return '循环结束';
  }

  Isolate _isolate;

  void startIsolate() async {
    ReceivePort receivePort = ReceivePort();
    receivePort.listen((message) {
      if (message is SendPort) {
        print('双向通信建立成功');
        message.send(Bean(1000000));
        return;
      }
      if (message is String) {
        print(message);
        return;
      }
    }, onError: (error) {
      print('发生了错误：$error');
    }, onDone: () {});
    _isolate = await Isolate.spawn(testIsolate, receivePort.sendPort);
  }

  static void testIsolate(SendPort sendPort) {
    ReceivePort receivePort = ReceivePort();
    receivePort.listen((message) {
      if (message is Bean) {
        for (int i = 0; i < message.count; i++) {}
        sendPort.send('耗时操作结束,i=${message.count}');
        return;
      }
      sendPort.send('其他消息');
    }, onError: (error) {
      print('发生错误：$error');
    }, onDone: () {});
    sendPort.send(receivePort.sendPort);
  }

  @override
  void dispose() {
    super.dispose();
    _isolate.kill(priority: Isolate.immediate);
  }
}

class Bean {
  int count;

  Bean(this.count);
}
