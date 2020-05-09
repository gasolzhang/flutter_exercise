import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ButtonState();
  }
}

class ButtonState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('ButtonDemo页'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => print('点击了iconbutton'),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              width: double.infinity,
              height: 80,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.green,
                onPressed: () => print('点击了按钮1'),
                child: Text('按钮1'),
              ),
            ),
            Container(
              child: RaisedButton.icon(
                  color: Colors.blue,
                  onPressed: () => print('点击了按钮2'),
                  icon: Icon(Icons.search),
                  label: Text('icon按钮')),
            ),
            Container(
              width: 80,
              height: 80,
              child: RaisedButton(
                splashColor: Colors.red,
                highlightColor: Colors.deepPurple,
                shape: CircleBorder(
                    side: BorderSide(color: Colors.cyanAccent, width: 2)),
                color: Colors.yellow,
                textColor: Colors.red,
                elevation: 20,
                child: Text('圆形按钮'),
                onPressed: () => print('点击了圆形按钮'),
              ),
            ),
            Container(
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.deepOrangeAccent,
                child: Text('扁平化按钮'),
                onPressed: () => print('点击了FlatButton'),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: OutlineButton(
                textColor: Colors.cyan,
                color: Colors.deepOrangeAccent, //边框按钮设置背景颜色是无效的
                child: Text('边框按钮'),
                onPressed: () => print('点击了边框按钮'),
              ),
            ),
            getButtonBar()
          ],
        ),
      ),
      floatingActionButton: getFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerFloat, ///centerDocked和BottomNavBar融合在一起
    );
  }
}

Widget getButtonBar() {
  return Container(
      width: double.infinity,
      child: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            color: Colors.green,
            textColor: Colors.white,
            child: Text('登录'),
            onPressed: () => print('点击了登录按钮'),
          ),
          RaisedButton(
            color: Colors.green,
            textColor: Colors.white,
            child: Text('注册'),
            onPressed: () => print('点击了注册按钮'),
          )
        ],
      ));
}

Widget getFloatingActionButton() {
  return FloatingActionButton(
    backgroundColor: Colors.green,
    child: Icon(Icons.add),
    onPressed: () => print('点击了floatbutton'),
  );
}
