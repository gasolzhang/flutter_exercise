import 'dart:convert';

void jsonEncode() {
  Map<String, dynamic> map = {'name': '张三', 'age': 20, 'gender': '男'};
  String jsonStr = json.encode(map);
  print('jsonStr=$jsonStr');

  Map<String, dynamic> m = json.decode(jsonStr);
  print(m is Map);
}
