import 'package:flutter/material.dart';
class CounterProvider extends ChangeNotifier{
  int _counter = 0;
  int get counter => _counter;
  void increment(){
    _counter++;
    notifyListeners();
  }
}
class themeProvider extends ChangeNotifier{
  ThemeMode _themeMode =ThemeMode.light;
  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _themeMode == ThemeMode.dark;
  void toggleTheme(){
    if(_themeMode == ThemeMode.light){
      _themeMode = ThemeMode.dark;
    }else{
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}