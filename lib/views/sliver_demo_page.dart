/**
 *  Author:GasolZhang
 *  Date:2020-04-12
 */

import 'package:flutter/material.dart';

///
class SliverDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<SliverDemoPage> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    this.tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return _getNestScrollBody();
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _getAppBar(),
//          _getSliverList(),
//          _getSliverFixExtendList()
//          _getSliverGrid(),
//          _getSliverHeader(),
//          _getTabBarViews(),
//          _getBoxAdapter(),
//          _getFillViewPort(),
          _getSliverHeader(),
          _getTabBarViews(),
//          _getBoxAdapter()
        ],
      ),
    );
  }

  Widget _getAppBar() {
    return SliverAppBar(
//      backgroundColor: Colors.redAccent,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
      expandedHeight: 250,//完全展开后的高度
      //下拉时，先下拉收缩部分还是先下拉内容部分
      floating: false,
      //标题栏是否黏在顶部
      pinned: true,
      //是否自动收起/下拉
      snap: false,
      flexibleSpace: FlexibleSpaceBar(
        title: new Text("标题标题标题"),
        centerTitle: true,
        collapseMode: CollapseMode.parallax,
        background: Image.network(
          'http://t9.baidu.com/it/u=1307125826,3433407105&fm=79&app=86&f=JPEG?w=5760&h=3240',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _getSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return ListTile(
          leading: Icon(Icons.image),
          title: Text('选项$index'),
        );
      }, childCount: 20),
    );
  }

  Widget _getSliverFixExtendList() {
    return SliverFixedExtentList(
      itemExtent: 50, //item固定高度
      delegate: SliverChildBuilderDelegate((context, index) {
        return Container(
          height: 50,
          color: Colors.green,
          child: Text('$index'),
        );
      }, childCount: 20),
    );
  }

  Widget _getSliverGrid() {
    return SliverPadding(
      padding: EdgeInsets.all(10),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Container(
            color: Colors.greenAccent,
            child: Center(
              child: Text('$index'),
            ),
          );
        }, childCount: 20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
      ),
    );
  }

  Widget _getSliverHeader() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: StickyTabBarDelegate(
        child: TabBar(
          labelColor: Colors.black,
          controller: this.tabController,
          tabs: <Widget>[
            Tab(text: 'Home'),
            Tab(text: 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget _getTabBarViews() {
    return TabBarView(
      controller: this.tabController,
      children: getListViews(),
    );
  }

  Widget _getBoxAdapter() {
    return SliverToBoxAdapter(child: Text('普通widget放到Sliver中'));
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

  Widget _getFillViewPort() {
    return SliverFillViewport(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Text('item$index');
      }, childCount: 20),
    );
  }

  ScrollController _scrollController = ScrollController();

  Widget _getNestScrollBody() {
    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      print('滚动距离：$offset');
    });

    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        physics: ClampingScrollPhysics(), //下拉不回弹
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [_getAppBar(), _getSliverHeader()];
        },
        body: _getTabBarViews(),
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return this.child;
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
