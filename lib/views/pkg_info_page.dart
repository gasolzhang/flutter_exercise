import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InfoState();
  }
}

class InfoState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('APP信息页面')),
      body: Container(child: Column(
        children: <Widget>[

        ],
      )),
    );
  }
}
