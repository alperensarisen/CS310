import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)),home: HomePage(),));
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),centerTitle: true,),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen2()));
        }, child: Text("Go to Page2")),
      ),
    );
  }
}
class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen2"),centerTitle: true,),
      body: Center(
        child: Column(
          children: [
            Text("Screen 2"),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Go Back"))
          ],
        ),
      )
    );
  }
}