import 'package:flutter/material.dart';
void main() => runApp(const MaterialApp(home: Screen1()));
class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen 1"), centerTitle: true,),
      body: Center(
        child: Text("SCREEN 1", style: TextStyle(color: Colors.green),),
      ),
    );
  }
}