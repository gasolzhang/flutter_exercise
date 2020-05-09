import 'dart:convert';

import 'package:dio/dio.dart';


class DioRequest {
  //创建dio方式一
  static final baseOptions = BaseOptions(
      baseUrl: 'https://www.xx.com/api',
      connectTimeout: 5000,
      receiveTimeout: 5000);

  static final dio = Dio(baseOptions);

  static Future<Map<String, dynamic>> request(String url,
      {String method = 'get', Map<String, dynamic> params}) async {
//创建dio方式2
//    BaseOptions options = BaseOptions(
//        baseUrl: 'https://www.xx.com/api',
//        connectTimeout: 5000,
//        receiveTimeout: 5000);
//    Dio dio2 = Dio(options);

//    try {
//      Options options = Options(method: method);
//      final response =
//          await dio.request(url, queryParameters: params, options: options);
//      BaseModel baseModel = BaseModel.fromMap(response.data);
//      return baseModel.data;
//    } on DioError catch (e) {
//      throw e;
//    }

    Future<Map<String, dynamic>> future =
        Future.delayed(Duration(milliseconds: 200), () {
      Map<String, dynamic> map = Map<String, dynamic>();
      map['code'] = 200;
      map['message'] = 'success';

      Map<String, dynamic> dataMap = Map<String, dynamic>();
      dataMap['total'] = 20;
      dataMap['index'] = 1;

      List<Map<String, dynamic>> dataList = List<Map<String, dynamic>>();
      for (int i = 1; i < 20; i++) {
        Map<String, dynamic> m = Map<String, dynamic>();
        m['id'] = i;
        m['name'] = 'jojo的奇妙冒险3';
        m['category'] = ['奇幻', '冒险'];
        m['score'] = 9.2;
        m['intro'] = '噢啦噢啦噢啦';
        m['image'] =
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582283028259&di=e3c2e472ee5c7b79127099e51ff94c1f&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201812%2F30%2F20181230220834_hqfxh.jpg';
        m['duration'] = '100分钟';
        List<String> roles = List<String>();
        roles.add('卖鱼强');
        roles.add('老东西');
        roles.add('波波');
        roles.add('卡Q因');
        roles.add('阿布德尔');
        m['roles'] = roles;
        dataList.add(m);
      }
      dataMap['datas'] = dataList;
      map['data'] = dataMap;
      return dataMap;
    });
    return future;
  }

  static dioGet(String url) async {
    Response response = await Dio().get(url);
    var result = json.decode(response.data);
  }

  static dioPost(String url, Map<String, dynamic> map) async {
    Response response = await Dio().post(url, data: map);
    var result = json.decode(response.data);
  }
}
