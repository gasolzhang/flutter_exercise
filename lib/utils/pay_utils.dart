import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PayUtils {
  static doAliPay(String signedInfo, void callback(bool result)) async {
//    var result = await SyFlutterAlipay.pay(signedInfo,
//        urlScheme: '你的ios urlScheme', //前面配置的urlScheme
//        isSandbox: true //是否是沙箱环境，只对android有效
//        );
//    callback(result);
  }

  static doWXPay(String signedInfo) {}
}
