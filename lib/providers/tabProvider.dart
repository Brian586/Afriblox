import 'package:flutter/material.dart';

class TabProvider with ChangeNotifier {
  String _currentTab = "Code";

  String get currentTab => _currentTab;

  changeTab(String tab) {
    _currentTab = tab;

    notifyListeners();
  }
}