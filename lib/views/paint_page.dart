import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../res.dart';

/**
 *  Author:GasolZhang
 *  Date:2020-04-09
 */

///
class PaintDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PaintDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ui.Image>(
        future: getImage(
            'http://rs.0.gaoshouyou.com/i/4e/73/144e9aa42773515bd1510a5225e2b895.jpg'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              width: 100,
              height: 100,
              child: CustomPaint(
//                size: Size(100, 100),
                painter: MyPainter(snapshot.data),
              ),
            );
          }

          return Image.asset(Res.image_placeholder,
              width: 200, height: 100, fit: BoxFit.cover);
        },
      ),
    );
  }

  /// 加载图片
  Completer<ImageInfo> completer = Completer();

  Future<ui.Image> getImage(String path) async {
    var img = new NetworkImage(path);
    img.resolve(ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      completer.complete(info);
    }));
    ImageInfo imageInfo = await completer.future;
    print('返回image');
    return imageInfo.image;
  }
}

class MyPainter extends CustomPainter {
  Paint mPaint;
  final ui.Image image;

  MyPainter(this.image) {
    print('接收到的image:$image');
  }

  @override
  void paint(Canvas canvas, Size size) {
    mPaint = Paint();
    //对图片做模糊处理(毛玻璃效果)
    mPaint.imageFilter = ui.ImageFilter.blur(sigmaX: 10,sigmaY: 10);
    mPaint.isAntiAlias = true;
    mPaint.filterQuality = FilterQuality.low;
//    mPaint.color = Colors.red;
//    mPaint.style = PaintingStyle.stroke;
//    mPaint.strokeWidth = 1;
//    canvas.drawCircle(
//        Offset(size.width / 2, size.height / 2), size.width / 2, mPaint);
    canvas.drawImage(image, Offset.zero, mPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
