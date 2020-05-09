import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../res.dart';

class SubjectPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SubjectState();
  }
}

class SubjectState extends State<SubjectPage> {
  @override
  Widget build(BuildContext context) {
    return _getGifContent();
    print('SubjectState的Context=$context');
    return Scaffold(
      appBar: AppBar(title: Text('书影音')),
      body: Center(
        child: RaisedButton(
          color: Colors.green,
          child: Text(
            '返回BACK',
            style: TextStyle(height: 1),
          ),
          //height：行高，为字体大小的倍数
          onPressed: () {
            setState(() {
              Navigator.of(context)
                  .pop(SubjectReturnArgument('SubjectPage的返回值')); //关闭当前页面
            });
          },
        ),
      ),
    );
  }

  Widget _getGifContent() {
    return Scaffold(
        body: Center(
      child: Image.asset(Res.gif_demo),
    ));
  }
}

class SubjectReturnArgument {
  final argument;

  SubjectReturnArgument(this.argument);
}
