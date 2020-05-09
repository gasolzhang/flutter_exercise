import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class DateTimePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DateTimeState();
  }
}

class DateTimeState extends State<DateTimePage> {
  String time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('时间相关Demo'),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('选择日期'),
            onPressed: () {
              setState(() {
                showBottomDatePicker();
              });
            },
          ),
          InkWell(
              child: Text('打开时间组件'),
              onTap: () {
                _showDatePicker();
              }),
          RaisedButton(
            child: Text('打开时间选择器'),
            onPressed: () {
              _showTimePicker();
            },
          ),
          Text(
              '选择的时间:${bottomTime?.year}年${bottomTime?.month}月${bottomTime?.day}日')
        ],
      )),
    );
  }

  void _showDatePicker() {
    showDatePicker(
      context: this.context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2050),
    ).then((onValue) {
      print(formatDate(onValue, [yyyy, '年', mm, '月', dd, '日']));
    });
  }

  void _showTimePicker() async {
    TimeOfDay select = await showTimePicker(
        context: this.context, initialTime: TimeOfDay(hour: 18, minute: 51));
    print(select);
  }

  DateTime bottomTime;

  void showBottomDatePicker() {
    DatePicker.showDatePicker(this.context,
        minDateTime: DateTime.parse('1980-01-01'),
        maxDateTime: DateTime.parse('2050-01-01'),
        initialDateTime: DateTime.now(),
        dateFormat: "yyyy-MM-dd",
        pickerMode: DateTimePickerMode.date,
        locale: DateTimePickerLocale.zh_cn,
        onCancel: () {},
        onChange: (DateTime dateTime, List<int> selectedIndex) {},
        onClose: () {},
        onConfirm: (DateTime dateTime, List<int> selectedIndex) {
      setState(() {
        bottomTime = dateTime;
      });
    });
  }
}

void format() {
  int million = DateTime.now().millisecondsSinceEpoch;
  print('当前时间毫秒值：${million}');
  print('毫秒值格式化:${DateTime.fromMicrosecondsSinceEpoch(million)}');
  print(formatDate(DateTime.now(), [yyyy, '年', mm, '月', dd, '日']));
}
