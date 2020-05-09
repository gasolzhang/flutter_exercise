import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedBuildPage extends StatefulWidget {
  @override
  _SpinnerState createState() => _SpinnerState();
}

class _SpinnerState extends State<AnimatedBuildPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AnimatedBuilder(
              animation: _controller,
              child:
                  Container(width: 200.0, height: 200.0, color: Colors.green),
              builder: (BuildContext context, Widget child) {
                return Transform.rotate(
                  angle: _controller.value * 2.0 * 3.14,
                  child: child,
                );
              },
            ),
            RaisedButton(
              child: Text('开始'),
              onPressed: () {
                _controller.repeat();
              },
            )
          ],
        ),
      ),
    );
  }
}
