import 'dart:ui';

/**
 *  Author:GasolZhang
 *  Date:2020-05-06
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res.dart';

///
class BlurPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            Res.blur,
            fit: BoxFit.cover,
          ),
          Center(
            child: BlurRectWidget(
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'BackdropFilter class',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      'A widget that applies a filter to the existing painted content and then paints child.'
                      'The filter will be applied to all the area within its parent or ancestor widget\'s clip. If there\'s no clip, the filter will be applied to the full screen.',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 150),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                BlurOvalWidget(
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    iconSize: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: BlurOvalWidget(
                    Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                BlurOvalWidget(
                  Icon(
                    Icons.bookmark,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BlurRectWidget extends StatelessWidget {
  final Widget _widget;
  double _padding = 10;

  BlurRectWidget(this._widget, {double padding = 0}) {
    if (padding != 0) this._padding = padding;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 50,
            sigmaY: 50,
          ),
          ///BackdropFilter对Container(固定为Container)进行模糊处理，该Container一定要指定颜色或者child，否则什么都不会显示
          child: Container(
            padding: EdgeInsets.all(_padding),
            color: Colors.white.withOpacity(0.3),///模糊色，设置不同的颜色就相当于不同的毛玻璃效果
            child: _widget,
          ),
        ),
      ),
    );
  }
}

class BlurOvalWidget extends StatelessWidget {
  final Widget _widget;
  double _padding = 10;

  BlurOvalWidget(this._widget, {double padding = 0}) {
    if (padding != 0) this._padding = padding;
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
        ),
        child: Container(
          color: Colors.white10,
          padding: EdgeInsets.all(_padding),
          child: _widget,
        ),
      ),
    );
  }
}
