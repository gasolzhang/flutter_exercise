import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview/utils/launch_utils.dart';

class LaunchUrlPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LaunchState();
  }
}

class LaunchState extends State<LaunchUrlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('打开外部页面')),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text('打开外部浏览器'),
                onPressed: () =>
                    LaunchUtils.launchByString('https://www.baidu.com')),
            RaisedButton(
              child: Text('拨打电话'),
              onPressed: () => LaunchUtils.launchByString('tel:13629734476'),
            ),
            RaisedButton(
              child: Text('发送短信'),
              onPressed: () => LaunchUtils.launchByString('sms:13629734476'),
            ),
            RaisedButton(
              child: Text('打开外部应用'),
              onPressed: () => LaunchUtils.launchByString('weixin://'),//alipays://
            )
          ],
        ),
      ),
    );
  }
}
