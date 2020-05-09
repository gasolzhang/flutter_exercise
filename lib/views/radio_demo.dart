import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RadioState();
  }
}

class RadioState extends State<RadioPage> {
  int gender;

  List<Widget> getRadioTiles() {
    return List.generate(2, (index) {
      return RadioListTile(
        value: index,
        groupValue: gender,
        onChanged: (value) {
          setState(() {
            gender = value;
          });
        },
        title: Text(index % 2 == 0 ? '男' : '女'),
        subtitle: Text('性别'),
        secondary: Icon(Icons.help),
        selected: gender == 0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RadioDemo')),
      body: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('男'),
                Radio<int>(
                  value: 1,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                  groupValue: this.gender,
                ),
                SizedBox(
                  height: 10,
                ),
                Text('女'),
                Radio<int>(
                  value: 2,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                  groupValue: this.gender,
                )
              ],
            ),
            getRadioTiles()[0],
            getRadioTiles()[1],
          ],
        ),
      ),
    );
  }
}
