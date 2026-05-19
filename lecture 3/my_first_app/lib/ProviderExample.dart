import 'package:flutter/material.dart';
import 'package:my_first_app/practice3.dart';
import 'package:provider/provider.dart';
class CounterProvider extends ChangeNotifier{
  int _counter = 0;
  int get counter => _counter;
  void increment(){
    _counter++;
    notifyListeners();
  }
}
void main()=> runApp(ChangeNotifierProvider(
  create: (_) => CounterProvider(),
  child: const MaterialApp(home: MyApp()))
);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterProvider>().counter;
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Center(child: Text('Counter: $counter'),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        context.read<CounterProvider>().increment();
      },
      child: Icon(Icons.add),),
    );
  }
}