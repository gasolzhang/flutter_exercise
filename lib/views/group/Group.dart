import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Group extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Expanded(
                child: TabBar(
                  indicatorColor: Colors.red,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white10,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: getTabs(),
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: getListViews(),
        ),
      ),
    );
  }
}

List<Tab> getTabs() {
  return List.generate(4, (index) {
    return Tab(text: 'tab$index');
  });
}

List<ListView> getListViews() {
  return List.generate(4, (index) {
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
