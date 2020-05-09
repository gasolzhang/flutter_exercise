/**
 *  Author:GasolZhang
 *  Date:2020-04-08
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
class AnimatedWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<AnimatedWidgetPage> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
//    _controller.addStatusListener((state) {
//      if (state == AnimationStatus.completed) {
//        _controller.reverse();
//        return;
//      }
//
//      if (state == AnimationStatus.dismissed) {
//        _controller.forward();
//        return;
//      }
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            AnimatedTestWidget(
                animation: ColorTween(begin: Colors.green, end: Colors.red)
                    .animate(_controller)),
            RaisedButton(
              child: Text('正向播放'),
              onPressed: () {
                _controller.forward();
              },
            ),
            RaisedButton(
              child: Text('反向播放'),
              onPressed: () {
                _controller.reverse();
              },
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}

class AnimatedTestWidget extends AnimatedWidget {
  final Animation<Color> animation;

  AnimatedTestWidget({Key key, this.animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    return Container(color: animation.value, width: 100, height: 100);
  }
}
