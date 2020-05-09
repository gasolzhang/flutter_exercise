import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_webview/component/dash_line.dart';
import 'package:flutter_webview/component/star_rating.dart';
import 'package:flutter_webview/models/home_model.dart';

class MovieListItem extends StatelessWidget {
  final MovieItemModel model;

  MovieListItem(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 10, color: Colors.grey[400])),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getRankWidget(model.id),
          SizedBox(height: 10),
          getContentWidget(model),
          SizedBox(height: 10),
          getNameWidget(model.name),
        ],
      ),
    );
  }
} /**/

Widget getRankWidget(int rank) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 9),
    decoration: BoxDecoration(
        color: Colors.yellow[700], borderRadius: BorderRadius.circular(5)),
    child: Text('NO.$rank', style: TextStyle(color: Colors.white)),
  );
}

Widget getNameWidget(String name) {
  return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(5)),
      child: Text(name, style: TextStyle(color: Colors.black54, fontSize: 18)));
}

Widget getContentWidget(MovieItemModel model) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      getImageWidget(model.image),
      getInfoWidget(model),
      getDashedWidget(),
      getWishWidget()
    ],
  );
}

Widget getImageWidget(String url) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.network(url, height: 150, width: 100, fit: BoxFit.cover));
}

Widget getWishWidget() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/images/wish.png',
          width: 30,
          height: 30,
          color: Colors.yellow[700],
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          '想看',
          style: TextStyle(color: Colors.yellow[700]),
        )
      ],
    ),
  );
}

Widget getNamePartWidget(MovieItemModel model) {
  return Row(
    children: <Widget>[
      Icon(Icons.play_circle_outline, color: Colors.red[400]),
      Expanded(
        child: Text(model.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
    ],
  );
}

Widget getInfoWidget(MovieItemModel model) {
  //Expanded相当于weight=1+width=0
  return Expanded(
      child: Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        getNamePartWidget(model),
        getRatingBar(model.score),
        getIntroWidget(model),
      ],
    ),
  ));
}

Widget getIntroWidget(MovieItemModel model) {
  return Text('${model.category.join(' ') + ' ' + model.roles.join('/')}');
}

Widget getDashedWidget() {
  return Container(
    width: 1,
    height: 100,
    child: DashedLine(
        axis: Axis.vertical,
        dashedWidth: 1,
        dashedHeight: 5,
        count: 10,
        color: Colors.black45),
  );
}

Widget getRatingBar(double score)
{
  return StarRatingBar(score);
}