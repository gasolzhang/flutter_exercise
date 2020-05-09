/**
 *  Author:GasolZhang
 *  Date:2020-04-05
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            width: 200,
            height: 200,
            child: Card(
              child: Image.network(
                  'http://t9.baidu.com/it/u=3363001160,1163944807&fm=79&app=86&f=JPEG?w=1280&h=830',fit: BoxFit.cover,),
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.all(10),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 4,spreadRadius: 2,offset: Offset(0,2))],
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(4.0)),
            child: Image.network(
                'http://t9.baidu.com/it/u=3363001160,1163944807&fm=79&app=86&f=JPEG?w=1280&h=830',fit: BoxFit.cover,),
          )
        ],
      ),
    );
  }
}
