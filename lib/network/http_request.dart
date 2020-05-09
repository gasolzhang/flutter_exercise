import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpRequest {
  void httpGet(String url) async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      int code = map['code'];
      String message = map['message'];
      Map<String, dynamic> data = map['data'];
    } else {}
  }

  void httpPost(String url, Map<String, String> params) async {
    var response = await http.post(url, body: params);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      int code = map['code'];
      String message = map['message'];
      Map<String, dynamic> data = map['data'];
    }
  }
}
