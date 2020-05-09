import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RefreshPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RefreshState();
  }
}

class RefreshState extends State<RefreshPage> {
  List<String> datas = [];
  ScrollController controller;
  int pageIndex = 0;
  bool hasMore = true;

  @override
  void initState() {
    super.initState();
    initScrollController();
    onRefresh();
  }

  void initScrollController() {
    controller = ScrollController();
    controller.addListener(() {
      print('滚动条下拉距离=${controller.position.pixels}');
      print('最大滚动高度=${controller.position.maxScrollExtent}');
      double curScrollHeight = controller.position.pixels;
      double maxHeight = controller.position.maxScrollExtent;
      if (maxHeight - curScrollHeight < 40) {
        //上拉加载
        _getDatas();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RefreshPage')),
      body: Container(
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.builder(
              controller: controller,
              itemCount: datas.length,
              itemBuilder: (BuildContext context, int index) {
                List<Widget> children = [];
                children.add(ListTile(title: Text(datas[index])));
                children.add(Divider());

                if (index == datas.length - 1) {
                  children.add(getMoreView());
                }

                return Column(children: children);
              }),
        ),
      ),
    );
  }

  Future<void> onRefresh() async {
    await Future<void>.delayed(Duration(seconds: 2), () {
      setState(() {
        datas = List.generate(20, (index) {
          return '当前值$index';
        });
      });
    });
//    await _getDatas();
  }

  void _getDatas() async {
    if (hasMore) {
      Response response = await Dio().get('url?page=$pageIndex');
      int stateCode = response.statusCode;
      var result = json.decode(response.data);
      if (stateCode == 200) {
        int errCode = result['code'];

        if (errCode == 10000) {
          //一些固定错误码，特殊处理
          return;
        }
        if (errCode == 200) {
          List<String> data = result['datas'];
          if (data == null || data.isEmpty) {
            hasMore = false;
          } else {
            setState(() {
              pageIndex++;
              datas.addAll(data);
            });
          }
        }
      }
    }
  }

  Widget getMoreView() {
    if (hasMore) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('加载中'),
          CircularProgressIndicator(
              backgroundColor: Colors.grey,
              strokeWidth: 1,
              valueColor: AlwaysStoppedAnimation(Colors.blue))
        ],
      );
    }
    return Center(child: Text('--我是有底线的--'));
  }
}
