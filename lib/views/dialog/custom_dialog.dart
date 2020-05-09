import 'package:flutter/material.dart';

typedef OnDismiss = Function();

class MyDialog extends Dialog {
  final String _title;
  final String _content;
  final OnDismiss onDismiss;

  MyDialog(this._title, this._content,this.onDismiss);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        onDismiss();
        return true;
      },
      child: Material(
        type: MaterialType.transparency, //dialog样式设为全透明
        child: Center(
            //center可使子组件水平居中
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              height: 200,
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Align(
                        child: Text('$_title'),
                        alignment: Alignment.center,
                      ),
                      Align(
                        child: InkWell(
                          child: Icon(Icons.close),
                          onTap: () {
                            onDismiss();
                            Navigator.pop(context);
                          },
                        ),
                        alignment: Alignment.centerRight,
                      )
                    ],
                  ),
                  Divider(),
                  Container(
                    width: double.infinity,
                    color: Colors.green,
                    child: Text('$_content'),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
