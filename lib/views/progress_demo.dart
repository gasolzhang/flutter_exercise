import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Progresspage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProgressState();
  }
}

class ProgressState extends State<Progresspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ProgressPage')),
      body: Container(
        child: Column(
          children: <Widget>[
            LinearProgressIndicator(
//              value: 0.5,//进度值固定，会造成没有动画效果，一般不用
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Colors.blue),//表示固定颜色的动画
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
                backgroundColor: Colors.grey,
                strokeWidth: 1,
                valueColor: AlwaysStoppedAnimation(Colors.blue))
          ],
        ),
      ),
    );
  }
}
