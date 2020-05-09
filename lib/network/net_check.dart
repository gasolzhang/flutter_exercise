import 'dart:async';

import 'package:connectivity/connectivity.dart';

class NetworkChecker {
  StreamSubscription<ConnectivityResult> subscription;

  Future<bool> isNetAvaliable() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  Future<bool> isWifi() async {
    var result = await (Connectivity().checkConnectivity());
    return result == ConnectivityResult.wifi;
  }

  void listenNetChange(void onData(ConnectivityResult result)) {
    subscription = Connectivity().onConnectivityChanged.listen(onData);
  }

  void dispose() {
    subscription?.cancel();
  }
}
