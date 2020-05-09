import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckBoxPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CheckBoxState();
  }
}

class CheckBoxState extends State<CheckBoxPage> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CheckBoxDemo')),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Checkbox(
                  value: flag,
                  onChanged: (checked) {
                    setState(() {
                      flag = checked;
                    });
                  },
                  activeColor: Colors.green,
                  checkColor: Colors.red,
                ),
              ],
            ),
            CheckboxListTile(
              value: flag,
              onChanged: (value) {
                setState(() {
                  flag = value;
                });
              },
              title: Text('主标题'),
              subtitle: Text('子标题'),
              secondary: Icon(Icons.flag),
            ),
          ],
        ),
      ),
    );
  }
}
