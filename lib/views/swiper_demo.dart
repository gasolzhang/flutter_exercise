import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SwiperState();
  }
}

class SwiperState extends State<SwiperPage> {
  List<String> images = [
    'http://abc.2008php.com/2011_Website_appreciate/2011-09-23/20110923002140.jpg',
    'http://attach.bbs.miui.com/forum/201304/25/195151szk8umd8or8fmfa5.jpg',
    'http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1208/07/c0/12746020_1344317236872.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SwiperPage')),
      body: Container(
          child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16.0/9.0,
            child: Container(
              child: Swiper(
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(images[index],fit: BoxFit.cover,);
                },
                pagination: new SwiperPagination(), //页面indicator
                control: new SwiperControl(), //左右翻页
              ),
            ),
          ),
        ],
      )),
    );
  }
}
