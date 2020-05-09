import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SwitchState();
  }
}

class SwitchState extends State<SwitchPage> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SwitchDemo')),
      body: Container(
        child: Column(
          children: <Widget>[
            Switch(
              value: state,
              onChanged: (value) {
                setState(() {
                  state = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
