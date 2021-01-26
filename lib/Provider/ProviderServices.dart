import 'package:flutter/material.dart';

class AutoLoginCheck with ChangeNotifier {
  bool value = false;

  void checkLoginVal(bool val) {
    value = val;
    notifyListeners();
  }
}
