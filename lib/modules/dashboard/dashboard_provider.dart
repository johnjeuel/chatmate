
import 'package:flutter/material.dart';

class DashboardProvider with ChangeNotifier {

  int _navigationIndex = 0;

  get navigationIndex => _navigationIndex;

  void setNavIndex(int index) {
    _navigationIndex = index;
    notifyListeners();
  }


}