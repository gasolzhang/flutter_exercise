import 'package:flutter/material.dart';

class BoxTransitionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BoxState();
  }
}

class WeWidgetState extends State<BoxTransitionPage>
    with SingleTickerProviderStateMixin {
  Animation<Decoration> _animation;
  AnimationController _controller;
  Animation _curve;

  Decoration _animationValue;
  AnimationStatus _state;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    _curve = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    _animation = DecorationTween(
      begin: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
        color: Colors.red,
      ),
      end: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
        color: Colors.green,
      ),
    ).animate(_curve)
      ..addListener(() {
        setState(() {
          _animationValue = _animation.value;
        });
      })
      ..addStatusListener((AnimationStatus state) {
        if (state == AnimationStatus.completed) {
          _controller.reverse();
        } else if (state == AnimationStatus.dismissed) {
          _controller.forward();
        }

        setState(() {
          _state = state;
        });
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("day11"),
      ),
      body: _buildColumn(),
    );
  }

  Widget _buildColumn() {
    return Column(
      children: <Widget>[
        AnimatorTransition(
          child: FlutterLogo(
            style: FlutterLogoStyle.horizontal,
            size: 200,
          ),
          animation: _animation,
        ),
        Text("动画值：" + _animationValue.toStringShort()),
        Text("动画状态：" + _state.toString()),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AnimatorTransition extends StatelessWidget {
  final Widget child;
  final Animation<Decoration> animation;

  AnimatorTransition({this.child, this.animation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBoxTransition(
        position: DecorationPosition.background,
        decoration: animation,
        child: Container(
          child: this.child,
        ),
      ),
    );
  }
}

class _BoxState extends State<BoxTransitionPage> with TickerProviderStateMixin{
  AnimationController _controller;
  Animation<Decoration> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 2),vsync: this);
    _animation = DecorationTween(
            begin: BoxDecoration(
                color: Colors.pinkAccent, borderRadius: BorderRadius.circular(0.0)),
            end: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(100)))
        .animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: DecoratedBoxTransition(
                decoration: _animation,
                child: InkWell(
                    onTap: () => _controller.repeat(reverse: true),
                    child: Container(width: 100, height: 100)))));
  }
}
