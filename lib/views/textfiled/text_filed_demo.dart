import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FieldState();
  }

  @override
  StatefulElement createElement() {
    // TODO: implement createElement
    return super.createElement();
  }
}

class FieldState extends State<TextFieldPage> with WidgetsBindingObserver {
  final nameController = TextEditingController();
  final pswController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    nameController.text = '初始用户名';
    nameController.addListener(() {});
    pswController.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    ///监听键盘收起/弹出
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      if (focusNode.hasFocus && MediaQuery.of(context).viewInsets.bottom > 50) {
        print("键盘弹出来了");
        return;
      }

      if (focusNode.hasFocus &&
          MediaQuery.of(context).viewInsets.bottom < 50) {
        print("键盘收起来了");
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey _key = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _key,
      appBar: AppBar(title: Text('输入框示例页面')),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            TextField(
              focusNode: focusNode,
              decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '请输入用户名',
                  border: OutlineInputBorder()),
              onChanged: (string) {},
              onSubmitted: (string) {
                print('FieldState--onSubmitted--$string');
              },
              controller: nameController,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true,
              keyboardType: TextInputType.text,
              //输入类型
              decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '请输入密码',
                  border: OutlineInputBorder()),
              onChanged: (string) {},
              controller: pswController,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('登录'),
                onPressed: () {
                  print('用户名：${nameController.text}');
                  print('密码：${pswController.text}');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
