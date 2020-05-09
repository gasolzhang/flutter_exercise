import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview/home_page.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashState();
  }
}

class SplashState extends State<StatefulWidget> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () => '页面跳转').then((onValue) {
      //页面跳转
      print('SplashState.then=$onValue');
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => HomePage(),
          settings: RouteSettings(arguments: SplashArgument('SplashPage'))));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.blue,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'http://pic4.zhimg.com/50/v2-9eeaf30dfdbc12fc8d68f89fc7d96615_hd.jpg',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                )),
            Text(
              '这是闪屏页',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            RaisedButton(
              color: Colors.green,
              child: Text('打开首页'),
              onPressed: () {
                setState(() {
                  ///通过路由打开新页面，并传值
//                  Navigator.pushNamed(context, '/mystack',
//                          arguments: SplashArgument('打开mystack页面'))
//                      .then((result) {
//                    print('mystack关闭后的返回值=$result');
//                  });
                  ///打开新页面替换当前页面
                  Navigator.pushReplacementNamed(context, '/mystack',
                      arguments: SplashArgument('打开mystack页面'));
                  ///清空历史栈再打开指定页面
//                  Navigator.pushAndRemoveUntil(
//                      context,
//                      MaterialPageRoute(
//                          builder: (BuildContext context) => MyStackPage()), (route) => route = null);
                });
              },
            )
          ],
        ),
      ),
    ));
  }
}

class SplashArgument {
  final pageName;

  SplashArgument(this.pageName);
}
