import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PayPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PayState();
  }
}

class PayState extends State<PayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('支付页面')),
        body: Container(
            child: Column(children: <Widget>[
              RaisedButton(child: Text('支付宝支付'),onPressed: (){

              },),
              RaisedButton(child: Text('微信支付')),
            ])));
  }
}
