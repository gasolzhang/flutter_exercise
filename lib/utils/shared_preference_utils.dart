import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtils {
  static void setValue(String key, dynamic value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (value is String) {
      sp.setString(key, value);
      return;
    }

    if (value is int) {
      sp.setInt(key, value);
      return;
    }

    if (value is double) {
      sp.setDouble(key, value);
      return;
    }

    if (value is bool) {
      sp.setBool(key, value);
      return;
    }

    if (value is List<String>) {
      sp.setStringList(key, value);
      return;
    }
  }

  static dynamic getValue(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.get(key);
  }

  static void remove(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }
}
