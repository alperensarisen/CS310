import 'package:flutter/material.dart';

Stream<int> numberStream() async*{
  for(int i = 0; i<=5; i++){
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}
void main(){
  runApp(MaterialApp(home: app(),));
}
class app extends StatefulWidget {
  const app({super.key});

  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: numberStream(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) return CircularProgressIndicator();
          return Container(
            child: Text("value ${snapshot.data}"),
          );
        },
      ),
    );
  }
}