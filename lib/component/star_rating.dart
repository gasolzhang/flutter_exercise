import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StarRatingBar extends StatefulWidget {
  final double score;

  StarRatingBar(this.score);

  @override
  State<StatefulWidget> createState() {
    return StarRatingState(score);
  }
}

class StarRatingState extends State<StarRatingBar> {
  final double score;

  StarRatingState(this.score);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        getUnSelectBar((score / 2).ceil()),
        getSelectBar(score),
      ],
    );
  }
}

Widget getSelectBar(double score) {
  final count = (score / 2).ceil();
  double clipWidth = (1-(count - score / 2)) * 24;

  return Row(
    mainAxisSize: MainAxisSize.min,
    children: List.generate(count, (index) {
      if (index < count - 1) {
        return Icon(
          Icons.star,
          color: Colors.yellow[700],
          size: 24,
        );
      }
      return ClipRect(
          clipper: MyClipper(clipWidth),
          child: Icon(Icons.star, color: Colors.yellow[700]));
    }),
  );
}

Widget getUnSelectBar(int count) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: List.generate(count, (index) {
      return Icon(
        Icons.star,
        color: Colors.grey[300],
        size: 24,
      );
    }),
  );
}

class MyClipper extends CustomClipper<Rect> {
  final double width;

  MyClipper(this.width) {
    print('裁剪宽度=$width');
  }

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(MyClipper oldClipper) {
    return width != oldClipper.width;
  }
}
