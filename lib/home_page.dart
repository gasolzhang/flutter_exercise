/**
 *  Author:GasolZhang
 *  Date:2020-04-19
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_webview/views/group/Group.dart';
import 'package:flutter_webview/views/home/Home.dart';
import 'package:flutter_webview/views/mall/Mall.dart';
import 'package:flutter_webview/views/mine/Mine.dart';
import 'package:flutter_webview/views/splash/splash_page.dart';
import 'package:flutter_webview/views/subject/Subject.dart';

import 'component/bottom_nav_item.dart';

///
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyStackState();
  }
}

class MyStackState extends State<HomePage> {
  int _curIndex = 0;

  @override
  void initState() {
    super.initState();
//    _getDeviceInfo();
  }

//  void _getDeviceInfo() async{
//    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//    print('Running on ${androidInfo.model}');  // e.g. "Moto G (4)"
//    print('androidInfo.version=${androidInfo.version}');
//    print('androidInfo.board=${androidInfo.board}');
//    print('androidInfo.bootloader=${androidInfo.bootloader}');
//    print('androidInfo.brand=${androidInfo.brand}');
//    print('androidInfo.device=${androidInfo.device}');
//    print('androidInfo.display=${androidInfo.display}');
//    print('androidInfo.fingerprint=${androidInfo.fingerprint}');
//    print('androidInfo.hardware=${androidInfo.hardware}');
//    print('androidInfo.host=${androidInfo.host}');
//    print('androidInfo.id=${androidInfo.id}');
//    print('androidInfo.manufacturer=${androidInfo.manufacturer}');
//    print('androidInfo.host=${androidInfo.host}');
//    print('androidInfo.model=${androidInfo.model}');
//    print('androidInfo.product=${androidInfo.product}');
//
////    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
////    print('Running on ${iosInfo.utsname.machine}');
//  }

  @override
  Widget build(BuildContext context) {
    //设置状态栏颜色
//    FlutterStatusbarcolor.setStatusBarColor(Colors.orange);
  //设置状态栏文字/图标亮色/暗色
//    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);

    SplashArgument argument = ModalRoute.of(context).settings.arguments;
    print('MyStackState的context=$context');
    print('MyStackState的argument=$argument');
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
          currentIndex: _curIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey[500],
          selectedFontSize: 14,
          unselectedFontSize: 12,
          iconSize: 24,
          type: BottomNavigationBarType.fixed,//BottomNavigationBaritem固定不滚动
          items: [
            BottomNavItem('home', '首页'),
            BottomNavItem('subject', '书影音'),
            BottomNavItem('group', '小组'),
            BottomNavItem('mall', '市集'),
            BottomNavItem('mine', '我的'),
          ],
          onTap: (int index) {
            setState(() => _curIndex = index);
          },
        ),
      ),
      body: IndexedStack(
        index: _curIndex,
        children: <Widget>[
          Home(),
          SubjectPage(),
          Group(),
          MallPage(),
          MinePage()
        ],
      ),
      drawer: getLeftDrawer(context),
      endDrawer: getRightDrawer(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,//浮动按钮居中显示
      floatingActionButton: Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.only(top: 10),//调整按钮位置
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.blue),
        padding: EdgeInsets.all(2),
        child: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () => Navigator.pushNamed(context, '/textfield'),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

Widget getLeftDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: UserAccountsDrawerHeader(
                accountName: Text('一只大沙雕'),
                accountEmail: Text('1042662554@qq.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'http://b-ssl.duitang.com/uploads/item/201712/20/20171220170611_NtSVj.thumb.700_0.jpeg'),
                ),
                otherAccountsPictures: <Widget>[
                  Image.network(
                      'http://cdn.duitang.com/uploads/item/201509/29/20150929131000_RhAWd.thumb.700_0.jpeg'),
                  Image.network(
                      'http://cdn.duitang.com/uploads/item/201509/29/20150929131000_RhAWd.thumb.700_0.jpeg'),
                ],
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'http://i0.hdslb.com/bfs/article/c038e2c76a9f79f0e6903143c5da94bae8697b48.jpg'))),
              ),
            ),
          ],
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('ButtonPage'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/button');
          },
        ),
        ListTile(
          leading: Icon(Icons.star),
          title: Text('CheckBoxPage'),
          onTap: () {
            Navigator.pushNamed(context, '/checkbox');
          },
        ),
        ListTile(
          leading: Icon(Icons.star),
          title: Text('RadioPage'),
          onTap: () {
            Navigator.pushNamed(context, '/radio');
          },
        ),
        ListTile(
          leading: Icon(Icons.star),
          title: Text('SwitchPage'),
          onTap: () {
            Navigator.pushNamed(context, '/switch');
          },
        ),
        ListTile(
          leading: Icon(Icons.star),
          title: Text('DateTimePage'),
          onTap: () {
            Navigator.pushNamed(context, '/datetime');
          },
        ),
        ListTile(
          leading: Icon(Icons.star),
          title: Text('SwiperPage'),
          onTap: () {
            Navigator.pushNamed(context, '/swiper');
          },
        ),
        ListTile(
          leading: Icon(Icons.star),
          title: Text('DialogPage'),
          onTap: () {
            Navigator.pushNamed(context, '/dialog');
          },
        ),
        ListTile(
          leading: Icon(Icons.star),
          title: Text('ToastPage'),
          onTap: () {
            Navigator.pushNamed(context, '/toast');
          },
        ),
        ListTile(
          leading: Icon(Icons.star),
          title: Text('ProgressPage'),
          onTap: () {
            Navigator.pushNamed(context, '/progress');
          },
        )
      ],
    ),
  );
}

Widget getRightDrawer(BuildContext context) {
  return Drawer(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: DrawerHeader(
                  child: Text('DrawerHeader'),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'http://b-ssl.duitang.com/uploads/item/201712/20/20171220170611_NtSVj.thumb.700_0.jpeg'))),
                ),
              ),
            ],
          ),
          ListTile(
            onTap: () => Navigator.of(context).pop(),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'http://b-ssl.duitang.com/uploads/item/201712/20/20171220170611_NtSVj.thumb.700_0.jpeg'),
            ),
            title: Text('一只大傻逼'),
          ),
          Divider(
            color: Colors.grey,
          ),
        ],
      ));
}
