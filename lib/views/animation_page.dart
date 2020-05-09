/**
 *  Author:GasolZhang
 *  Date:2020-04-06
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
class AnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<AnimationPage> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _sizeTween;
  Animation _colorTween;
  Animation _slideTween;
  Animation _rotationTween;

  AnimationController _rotationController;
  Animation _rotateTween;

  AnimationController _scaleController;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _sizeTween = Tween<double>(begin: 10, end: 300).animate(_controller);
    _colorTween = ColorTween(begin: Colors.greenAccent, end: Colors.red)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));
    _controller.forward();

//    _sizeTween = Tween<double>(begin: 0, end: 300).animate(CurvedAnimation(
//        parent:
//            AnimationController(vsync: this, duration: Duration(seconds: 10)),
//        curve: Curves.easeIn));
//    _sizeTween.addListener(() {});
//    _sizeTween.addStatusListener((state) {});

    _initSlideTween();
    _initRotationController();

    _initScaleController();
    _initSizeTrasitionController();

    _initComplexAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return _complexAnimationDemo();
//    return _animatedDefaultTextStyleDemo();
//    return _sizeTransitionDemo();
//    return _animatedAlignDemo();
//    return _animationPaddingDemo();
//    return _animationOpcityDemo();
//    return _crossFadeDemo();
//    return _animationContainer();
//    return Scaffold(
//      body: Center(
//          child:
//              _animationContainer() /*Container(
//            color: _colorTween.value,
//            width: _sizeTween.value,
//            height: _sizeTween.value),*/
//          ),
//    );
  }

  Widget _getScaleWidget() {
    return ScaleTransition(
      scale: _controller,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.greenAccent,
        child: Center(child: Text('放大动画')),
      ),
    );
  }

  Widget _getSlideWidget() {
    return SlideTransition(
      position: _slideTween,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
      ),
    );
  }

  void _initSlideTween() {
    _slideTween =
        Tween(begin: Offset(0, 0), end: Offset(1, 1)).animate(_controller);
  }

  void _initRotationController() {
    _rotationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _rotateTween =
        Tween<double>(begin: 0, end: 0.2).animate(_rotationController);
    _rotateTween.addStatusListener((state) {
      if (state == AnimationStatus.completed) {
//        print('正向动画结束:completed');
        _rotationController.reverse();
        return;
      }
      if (state == AnimationStatus.dismissed) {
//        print('反向动画结束:dismissed');
        _rotationController.forward();
        return;
      }
    });
//    _rotationController.addStatusListener((state) {
//      if (state == AnimationStatus.completed) {
////        print('正向动画结束:completed');
//        _rotationController.reverse();
//        return;
//      }
//      if (state == AnimationStatus.dismissed) {
////        print('反向动画结束:dismissed');
//        _rotationController.forward();
//        return;
//      }
//    });
    _rotationController.forward();
  }

  Widget _getRotationWidget() {
    return RotationTransition(
        turns: _rotateTween,
        child: Container(width: 100, height: 100, color: Colors.green));
  }

  void _initScaleController() {
    _scaleController = AnimationController(
        duration: Duration(seconds: 2),
        vsync: this,
        lowerBound: 0.0,
        upperBound: 4.0);
    _scaleController.forward();
  }

  Widget _getScaleTransistion() {
    return ScaleTransition(
      scale: _scaleController,
      child: Container(
        color: Colors.orange,
        width: 100,
        height: 100,
      ),
    );
  }

  AnimationController _sizeController;

  void _initSizeTrasitionController() {
    _sizeController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _sizeController.addStatusListener((state) {
      if (state == AnimationStatus.completed) {
        _sizeController.reverse();
        return;
      }
      if (state == AnimationStatus.dismissed) {
        _sizeController.forward();
        return;
      }
    });
    _sizeController.forward();
  }

  Widget _sizeTransitionDemo() {
    return Scaffold(
      body: Container(
        child: Center(
          child: SizeTransition(
              axisAlignment: -1.0,
              axis: Axis.vertical, //控制宽度或者高度缩放
              sizeFactor: Tween(begin: 0.0, end: 1.0).animate(_sizeController),
              child: Container(
                width: 200.0,
                height: 200.0,
                color: Colors.red,
                child: Center(child: Text('12345678')),
              )),
        ),
      ),
    );
  }

  double _size = 100;

  Widget _animationContainer() {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: AnimatedContainer(
              color: Colors.yellow,
              width: _size,
              height: _size,
              curve: Curves.bounceOut,
              duration: Duration(seconds: 1),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: RaisedButton(
              onPressed: () {
                setState(() {
                  _size += 20;
                });
              },
              child: Text('变大'),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: RaisedButton(
              onPressed: () {
                setState(() {
                  _size -= 20;
                });
              },
              child: Text('变小'),
            ),
          ),
        ],
      ),
    );
  }

  bool crossFirst = true;

  Widget _crossFadeDemo() {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            crossFirst = !crossFirst;
          });
        },
        child: Center(
          child: AnimatedCrossFade(
            duration: Duration(seconds: 1),
            crossFadeState: crossFirst
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: Container(
              color: Colors.yellow,
              width: 100,
              height: 100,
              child: Text('第一个Child'),
            ),
            secondChild: Container(
              color: Colors.red,
              width: 200,
              height: 200,
              child: Text('第二个Child'),
            ),
          ),
        ),
      ),
    );
  }

  bool _opcityState = true;

  Widget _animationOpcityDemo() {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            _opcityState = !_opcityState;
          });
        },
        child: Center(
          child: AnimatedOpacity(
              child: Container(
                width: 200,
                height: 200,
                color: Colors.deepOrange,
                child: Text(
                  "透明度动画演示",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
              //在opacity的值发生改后自动进行透明度动画
              opacity: _opcityState ? 1.0 : 0.1,
              duration: Duration(seconds: 2)),
        ),
      ),
    );
  }

  Widget _fadeAnmationDemo() {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _controller,
          //将要执行动画的子view
          child: InkWell(
            onTap: () => _controller.repeat(reverse: true),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }

  bool _paddingState = false;

  Widget _animationPaddingDemo() {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            _paddingState = !_paddingState;
          });
        },
        child: Center(
          child: Container(
            color: Colors.red,
            child: AnimatedPadding(
                duration: Duration(seconds: 2),
                padding: EdgeInsets.all(_paddingState ? 10 : 20),
                child: Text('paddnig动画')),
          ),
        ),
      ),
    );
  }

  bool _alignState = false;

  Widget _animatedAlignDemo() {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AnimatedAlign(
            curve: Curves.ease,
            duration: Duration(seconds: 5),
            alignment:
                _alignState ? Alignment.centerLeft : Alignment.centerRight,
            child: InkWell(
              child: Text('靠左/靠右'),
              onTap: () {
                setState(() {
                  _alignState = !_alignState;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  TextStyle _testStyle = TextStyle(color: Colors.red, fontSize: 12);

  Widget _animatedDefaultTextStyleDemo() {
    return Scaffold(
      body: Center(
        child: AnimatedDefaultTextStyle(
          duration: Duration(seconds: 2),
          style: _testStyle,
          child: InkWell(
              child: Text('测试文本'),
              onTap: () {
                setState(() {
                  _testStyle = TextStyle(color: Colors.green, fontSize: 20);
                });
              }),
        ),
      ),
    );
  }

  Widget _animatedPhysicModelDemo() {
    return Scaffold(
      body: Center(
        child: AnimatedPhysicalModel(
            duration: Duration(seconds: 2),
            shape: BoxShape.rectangle,
            elevation: 20.0,
            color: Colors.transparent,
            shadowColor: Colors.grey,
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.green,
            )),
      ),
    );
  }

  AnimationController _complexController;
  Animation<double> _complex1;
  Animation _complex2;

  void _initComplexAnimation() {
    _complexController =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    _complex1 = Tween<double>(begin: 100, end: 200).animate(
        CurvedAnimation(parent: _complexController, curve: Interval(0, 0.5)));
    _complex2 = ColorTween(begin: Colors.orange, end: Colors.blue).animate(
        CurvedAnimation(parent: _complexController, curve: Interval(0.5, 1)));
  }

  ///复合动画
  Widget _complexAnimationDemo() {
    return Scaffold(
        body: Center(
      child: InkWell(
          onTap: () => _complexController.forward(),
          child: AnimatedBuilder(
            animation: _complexController,
            builder: (context, child) {
              return Container(
                  color: _complex2.value,
                  width: _complex1.value,
                  height: _complex1.value);
            },
          )),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
