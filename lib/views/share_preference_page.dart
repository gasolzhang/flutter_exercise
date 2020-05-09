import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview/utils/shared_preference_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SharePreState();
  }
}

class SharePreState extends State<SharedPrePage> {
  String content = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('SharePreference存储')),
        body: Container(
          child: Column(
            children: <Widget>[
              getInput(),
              SizedBox(height: 10),
              RaisedButton(
                child: Text('保存到SharePreference'),
                onPressed: () {
//                  _save(content);
                  SharedPreferenceUtils.setValue('content', content);
                },
              ),
              RaisedButton(
                child: Text('从SharePreference读取'),
                onPressed: () async {
//                  _read();
                  String content =
                      await SharedPreferenceUtils.getValue('content');
                  setState(() {
                    this.content = content;
                  });
                },
              ),
              Text('$content'),
            ],
          ),
        ));
  }

  Widget getInput() {
    return Container(
        margin: EdgeInsets.all(10),
        height: 50,
        child: TextField(
          maxLines: 1,
          onChanged: (value) {
            content = value;
          },
          decoration: InputDecoration(border: OutlineInputBorder()),
        ));
  }

  void _save(String content) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('content', content);
  }

  void _read() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String content = sp.getString('content');
    setState(() {
      this.content = content;
    });
  }
}
