/**
 *  Author:GasolZhang
 *  Date:2020-05-06
 *  监听app状态
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
class AppLifecyclePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<AppLifecyclePage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("app状态测试")),
    );
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    /**
     * app切后台再切换来：
     *  inactive -> paused -> inactive -> resumed
     * */
    if (state == AppLifecycleState.inactive) {
      print("当前处于inactive闲置状态");
      return;
    }

    if (state == AppLifecycleState.paused) {
      print("当前处于paused暂停状态，相当于android的onPause状态");
      return;
    }

    if (state == AppLifecycleState.detached) {
      print("当前处于detached状态，仍处于flutter engine中，但是不在view树上");
      return;
    }

    if (state == AppLifecycleState.resumed) {
      print("当前处于resume状态，相当于android的onResume");
      return;
    }
  }
}
