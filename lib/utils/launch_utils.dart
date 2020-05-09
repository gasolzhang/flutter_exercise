import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchUtils {
  static launchByString(String urlString) async {
    bool can = await canLaunch(urlString);
    if (can) {
      bool result = await launch(urlString);
    } else {
      Fluttertoast.showToast(msg: '无法启动');
    }
  }
}
