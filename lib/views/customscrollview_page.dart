/**
 *  Author:GasolZhang
 *  Date:2020-05-08
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res.dart';

///
class CustomScrollViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CustomScrollViewPageState();
  }
}

class _CustomScrollViewPageState extends State<CustomScrollViewPage> {
  ScrollController scrollController = new ScrollController();
  bool showToTopBtn = false;
  double screenHeight;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      print(scrollController.positions.length);
      print(scrollController.position.toString());
      if (scrollController.offset < screenHeight && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (scrollController.offset >= screenHeight &&
          showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    print("screenHeight = " + screenHeight.toString());
    return Scaffold(
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                scrollController.animateTo(0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              },
            ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverAppBar(
            leading: Icon(Icons.arrow_back),
            centerTitle: true,
            title: const Text('Demo'),
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                Res.page1,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverGrid(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 4),
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 9)],
                  child: new Text('grid item $index'),
                );
              }, childCount: 20),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50,
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: new Text('list item $index'),
              );
            }, childCount: 50),
          )
        ],
      ),
    );
  }
}
