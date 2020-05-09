import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MallPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabbarControllerState();
  }
}

class TabbarControllerState extends State<MallPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  ///组件初始化时触发
  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
    _controller.addListener((){
      print('TabController.index=${_controller.index}');
      print(this._controller.toString());
      print(this._controller.index);
      print(this._controller.length);
      print(this._controller.previousIndex);
      setState(() {
        print('实现一些设置');
      });
    });
  }

  ///组件销毁时触发
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: TabBar(tabs: getTabs(), controller: _controller)),
        body: TabBarView(children: getListViews(), controller: _controller));
  }
}

List<Tab> getTabs() {
  return List.generate(2, (index) {
    return Tab(text: '选项$index');
  });
}

List<ListView> getListViews() {
  return List.generate(2, (index) {
    return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('item$index'),
            leading: Icon(Icons.image),
          );
        },
        itemCount: 20);
  });
}
