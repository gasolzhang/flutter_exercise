/**
 *  Author:GasolZhang
 *  Date:2020-03-14
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
class ColumnPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ColumnState();
  }
}

class ColumnState extends State<ColumnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Text('Demo'),
        Container(
          height: 50,
          width: 100,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(20),
          color: Colors.blue,
          child: Text('测试Container'),
        )
      ],
    ));
  }
}
