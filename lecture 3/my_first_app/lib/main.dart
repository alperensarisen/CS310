//! Some cmd codes for flutter:
//?   flutter --version -> Make sure flutter SDK is installed and added to your system PATH.
//?   flutter create my_first_app -> to create new flutter project
//?   then when we are in the project file by using "flutter run -d chrome" command
//?   we can see our app in chrome
//&   also by using "flutter devices" you can see possible devices you can use to your app

import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Hello World!"),
        ),
      ),
    );
  }
}