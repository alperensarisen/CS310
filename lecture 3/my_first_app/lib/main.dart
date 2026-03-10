import 'package:flutter/material.dart';
void main() => runApp(const MaterialApp(home: CounterApp()));
class CounterApp extends StatefulWidget{
  const CounterApp({super.key});
  @override
  State<CounterApp> createState() => _CounterAppState();
}
//! Stateful Widgets
//* When your UI needs to change dynamically - a tap timer, incoming data - you need a StatefulWidget

//& When to use:
//* Counters, forms, toggles, animations
//* Anything where the widget's output depends on data that changes over time
//* Start Stateless; convert only when you need mutable state.

//! Exercise
//TODO: Display the current count on screen
//TODO: Provide buttons to increment and decrement the count
class _CounterAppState extends State<CounterApp> {
  int _count = 0;
  @override
  Widget build(BuildContext content){
    return Scaffold(
      appBar: AppBar(title: Text("Counter"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_count', style: TextStyle(fontSize: 40),),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){setState((){_count++;});}, child: Icon(Icons.add)),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){setState((){_count--;});}, child: Icon(Icons.remove))
          ],
        )
      )
    );
  }
}