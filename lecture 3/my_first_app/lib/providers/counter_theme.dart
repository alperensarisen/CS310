import 'package:flutter/material.dart';
class CounterProvider2 extends ChangeNotifier{
  int _count = 0;
  int get count => _count;
  void increment(){
    _count++;
    notifyListeners();
  }
}
class ThemeProvider extends ChangeNotifier{
  bool isDark = false;
  void toggle(){
    isDark = !isDark;
    notifyListeners();
  }
}