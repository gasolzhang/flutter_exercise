/**
 *  Author:GasolZhang
 *  Date:2020-04-10
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
class ExpansionTilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<ExpansionTilePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("title"),
      ),
      body: new Center(
        child: ExpansionTile(
          title: Text("title"),
          leading: Icon(
            Icons.favorite,
            color: Colors.redAccent,
          ),
//          backgroundColor: Colors,
          initiallyExpanded: false,
          //默认是否展开
          children: <Widget>[
            ListTile(
              title: Text("ListTile"),
              leading: Icon(
                Icons.favorite_border,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
