import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_webview/network/dio_request.dart';

class NewsContentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewsContentState();
  }
}

class NewsContentState extends State<NewsContentPage> {
  Map<String, String> map;
  String html;

  @override
  void initState() {
    super.initState();
    map = ModalRoute.of(context).settings.arguments;
    _initData(map['aid']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('NewsContentPage')),
        body: ListView(children: <Widget>[
          //解析html并展示出来
          Html(
            data: '''$html''',
            padding: EdgeInsets.all(10),
            backgroundColor: Colors.white,
            defaultTextStyle: TextStyle(fontFamily: 'serif'),
            linkStyle: TextStyle(color: Colors.red),
            onLinkTap: (url){
              print('点击了url');
            },
          )
        ]));
  }

  void _initData(String aid) async {
    Response response = await DioRequest.dioGet('url?aid=$aid');
    setState(() {
      html = response.data['html'];
    });
  }
}
