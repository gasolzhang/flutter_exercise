/**
 *  Author:GasolZhang
 *  Date:2020-04-08
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview/res.dart';

///
class Hero1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
//          Hero(
//            tag: Res.hero_demo,
//            child: InkWell(
//                child: Image.asset(Res.hero_demo, width: 100, height: 100),
//                onTap: () {
//                  Navigator.of(context)
//                      .pushNamed('/hero2', arguments: Res.hero_demo);
//                }),
//          ),
          Hero(
            tag: 'http://pic4.zhimg.com/50/v2-7fece9a613445edb78271216c8c20c6d_hd.jpg',
            child: InkWell(
                child: Image.network(
                    'http://pic4.zhimg.com/50/v2-7fece9a613445edb78271216c8c20c6d_hd.jpg',
                    width: 100,
                    height: 100),
                onTap: () {
                  Navigator.of(context).pushNamed('/hero2',
                      arguments:
                          'http://pic4.zhimg.com/50/v2-7fece9a613445edb78271216c8c20c6d_hd.jpg');
                }),
          ),
        ],
      ),
    ));
  }
}
