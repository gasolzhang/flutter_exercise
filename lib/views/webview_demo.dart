import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

class WebViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WebViewState();
  }
}

class WebViewState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('WebViewPage')),
        body: Column(
          children: <Widget>[
            Expanded(
                child: InAppWebView(
              initialOptions: InAppWebViewWidgetOptions(),
              initialUrl: 'https://www.baidu.com',
              onLoadStart: (InAppWebViewController controller, String url) {
                print('开始加载');
              },
              onLoadStop: (InAppWebViewController controller, String url) {
                print('停止加载');
              },
              onLoadError: (InAppWebViewController controller, String url,
                  int code, String message) {
                print('加载出错');
              },
              onProgressChanged:
                  (InAppWebViewController controller, int progress) {},
            ))
          ],
        ));
  }
}
