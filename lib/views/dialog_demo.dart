import 'dart:async';

import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dialog/custom_dialog.dart';

class DialogPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DialogState();
  }
}

class DialogState extends State<DialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DialogPage')),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('弹出AlertDialog'),
              onPressed: () {
                _showAlertDialog();
              },
            ),
            RaisedButton(
              child: Text('弹出SimpleDialog'),
              onPressed: () {
                _showSimpleDialog();
              },
            ),
            RaisedButton(
              child: Text('弹出底部弹框'),
              onPressed: () {
                _showBottomModalSheet();
              },
            ),
            RaisedButton(
              child: Text('弹出自定义Dialog'),
              onPressed: () {
                _showCustomDialog();
              },
            )
          ],
        ),
      ),
    );
  }

  void _showAlertDialog() async {
    var result = await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('提示'),
            content: Text('确认删除？'),
            actions: <Widget>[
              FlatButton(
                child: Text('取消'),
                onPressed: () {
                  Navigator.pop(context, 'cancel');
                },
              ),
              FlatButton(
                child: Text('确定'),
                onPressed: () {
                  Navigator.pop(context, 'ok');
                },
              )
            ],
          );
        });
    print(result);
  }

  void _showSimpleDialog() async {
    var result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('简单Dialog'),
            children: <Widget>[
              SimpleDialogOption(
                  child: Text('option1'),
                  onPressed: () {
                    Navigator.pop(context, '选项1');
                  }),
              Divider(),
              SimpleDialogOption(
                child: Text('option2'),
                onPressed: () {
                  Navigator.pop(context, '选项2');
                },
              ),
              Divider(),
              SimpleDialogOption(
                child: Text('option3'),
                onPressed: () {
                  Navigator.pop(context, '选项3');
                },
              )
            ],
          );
        });

    print(result);
  }

  void _showBottomModalSheet() async {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            child: Column(
              children: <Widget>[
                ListTile(title: Text('分享A'), onTap: () {}),
                ListTile(title: Text('分享A'), onTap: () {}),
                ListTile(title: Text('分享A'), onTap: () {}),
              ],
            ),
          );
        });
  }

  void _showCustomDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return MyDialog('自定义标题', '自定义内容',(){
            print('自定义Dialog关闭了');
          });
        });
  }
}

int _count;

void showTimer() {
  Timer.periodic(Duration(seconds: 2), (Timer timer) {
    _count++;
    if (_count == 10) {
      timer.cancel();
    }
  });
}
