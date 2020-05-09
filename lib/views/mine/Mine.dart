import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MineState();
  }
}

class MineState extends State<MinePage> {
  List<String> datas;

  @override
  void initState() {
    super.initState();
    getDatas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MinePage')),
      body: Container(
        child: datas == null
            ? Text('加载中')
            : ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Icon(Icons.image),
                    title: Text(datas[index]),
                    onTap: () {
                      Navigator.pushNamed(context, datas[index]);
                    },
                  );
                },
                itemCount: datas.length),
      ),
    );
  }

  Future<void> getDatas() async {
    await Future.value(1).then((valaue) {
      List<String> list = [];
      list.add('/refresh');
      list.add('/html');
      list.add('/webview');
      list.add('/location');
      list.add('/imagepicker');
      list.add('/videoplayer');
      list.add('/share_preference');
      list.add('/scan');
      list.add('/launch');
      list.add('/rxdart');
      list.add('/take_picture');
      list.add('/ijkplayer');
      list.add('/auth_page');
      list.add('/card');
      list.add('/animation');
      list.add('/animation_list');
      list.add('/hero1');
      list.add('/animation_widget_page');
      list.add('/animation_builder_page');
      list.add('/box_transition_page');
      list.add('/paint_page');
      list.add('/expansion_tile');
      list.add('/sliver');
      list.add('/pager');
      list.add('/isolate');
      list.add('/staggerd');
      list.add('/sound');
      list.add('/lifecycle');
      list.add('/blur');
      list.add('/custom_scroll');
      setState(() {
        datas = list;
      });
    });
  }
}
