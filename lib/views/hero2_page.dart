/**
 *  Author:GasolZhang
 *  Date:2020-04-08
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
class Hero2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String image = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Container(
        child: AspectRatio(
            aspectRatio: 2.0,
            child: Hero(
                tag: image, child: Image.network(image, fit: BoxFit.cover))),
      ),
    );
  }
}
