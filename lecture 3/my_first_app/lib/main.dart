import 'package:flutter/material.dart';
void main() =>runApp(const MaterialApp(home: StateDemoScreen()));
/*
class My_App extends StatelessWidget {
  const My_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("State Demo", 
            style:TextStyle(fontSize: 20,
            fontWeight: FontWeight.bold)),
          ),
          body: Center(
            child: Text("Hello Flutter")
          ),
      )
    );
  }
} */
class StateDemoScreen extends StatefulWidget {
  const StateDemoScreen({super.key});

  @override
  State<StateDemoScreen> createState() => _StateDemoScreenState();
}

class _StateDemoScreenState extends State<StateDemoScreen> {
  int _count = 0;
  void _increment(){setState(() {_count++;});}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("State Demo", 
            style:TextStyle(fontSize: 20,
            fontWeight: FontWeight.bold)),
          ),
          body: Center(
            child: Text("Count $_count",
            style: const TextStyle(fontSize: 35))
          ),
          floatingActionButton: FloatingActionButton(onPressed: _increment,
          child: const Icon(Icons.add)
          ),
      )
    );
  }
}