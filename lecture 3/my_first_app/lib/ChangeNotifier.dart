import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void increment() {
    _count++;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: MaterialApp(home: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final number = context.watch<CounterProvider>();
    return Scaffold(body: Column(
      children: [
        Text("${number.count}"),
        ElevatedButton(onPressed: (){
          context.read<CounterProvider>().increment();
        }, child: Icon(Icons.add))
      ],
    ),);
  }
}
