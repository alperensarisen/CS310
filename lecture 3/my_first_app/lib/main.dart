import 'package:flutter/material.dart';
import 'pages/screen1.dart';
import 'pages/screen2.dart';
void main() => runApp(MaterialApp(
  routes: {
        '/': (context) => const MainPage(),
        '/screen1': (context) => const Screen1(),
        '/screen2': (context) => const Screen2(),
      },));
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),centerTitle: true, backgroundColor: Colors.teal,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/screen1');}, child: Text("Go to screen 1")),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/screen2');}, child: Text("Go to screen 2")),
          ],
        ),
      ),
    );
  }
}