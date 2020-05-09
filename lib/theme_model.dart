/**
 *  Author:GasolZhang
 *  Date:2020-03-28
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
class ThemeModel with ChangeNotifier {
  ThemeMode themeMode;

  ThemeModel(this.themeMode);

  void reverse() {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
