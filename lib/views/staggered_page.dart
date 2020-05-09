import 'dart:math';

/**
 *  Author:GasolZhang
 *  Date:2020-04-15
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

///
class StaggerdPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State2();
    return _State();
  }
}

class _State extends State<StaggerdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.red,
          ),
          title: Text('瀑布流'),
        ),
        body: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) => new Container(
              color: Colors.lightBlueAccent,
              child: new Center(
                child: new CircleAvatar(
                  backgroundColor: Colors.white,
                  child: new Text('$index'),
                ),
              )),
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(2, index.isEven ? 2 : 1),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ));
  }
}

class _State2 extends State<StaggerdPage> {
  String imageUrl =
      'http://img2.imgtn.bdimg.com/it/u=1670762905,3843170729&fm=26&gp=0.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('瀑布流'),
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
      body: StaggeredGridView.countBuilder(
          crossAxisCount: 4,//水平方向等分为几个格子
          itemCount: 20,
          mainAxisSpacing: 4,//竖直间距
          crossAxisSpacing: 4,//水平间距
          itemBuilder: (context, index) {
            return Container(
              color: Colors.lightBlue,
              child: Image.network(imageUrl, fit: BoxFit.cover),
              height: 100 + Random().nextInt(15) * 20.0,
            );
          },
          staggeredTileBuilder: (index) =>
              StaggeredTile.fit(2)), //每个子组件在水平方向几个格子宽
    );
  }
}
