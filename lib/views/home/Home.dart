import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview/models/home_model.dart';
import 'package:flutter_webview/network/dio_request.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../theme_model.dart';
import 'movie_list_item.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页',style: GoogleFonts.cuteFont()),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => Provider.of<ThemeModel>(context).reverse(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => print('点击了搜索按钮'),
          )
        ],
      ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeBodyState();
  }
}

class HomeBodyState extends State<HomeBody> {
  MovieModel datas;

  @override
  void initState() {
    super.initState();
    DioRequest.request('url', method: 'get', params: {'k1': 'v1', 'k2': 'v2'})
        .then((res) {
      print('请求到的数据：$res');
      setState(() {
        datas = MovieModel.fromMap(res);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),//ClampingScrollPhysics() :波纹效果(android风格)；BouncingScrollPhysics：回弹效果(ios风格)
        itemCount: datas?.items?.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieListItem(datas.items[index]);
        });
  }
}
