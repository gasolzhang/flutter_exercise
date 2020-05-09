import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ToastState();
  }
}

class ToastState extends State<ToastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ToastPage')),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text('弹出Toast'),
                onPressed: () {
                  _showToast();
                })
          ],
        ),
      ),
    );
  }

  void _showToast() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
