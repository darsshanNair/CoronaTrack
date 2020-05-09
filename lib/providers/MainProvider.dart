import 'package:flutter/material.dart';

class MainProvider with ChangeNotifier {
  bool _isDarkModeOn = false;

  bool get darkModeStatus => _isDarkModeOn;

  set darkModeStatus(bool darkMode) {
    _isDarkModeOn = darkMode;
    notifyListeners();
  }
}
