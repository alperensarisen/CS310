import 'package:flutter/material.dart';
import 'package:my_first_app/providers/counterProvider.dart';
import 'package:provider/provider.dart';
import 'providers/counter_theme.dart';
void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider2()),
      ChangeNotifierProvider(create: (_)=> ThemeProvider()),
      ],
      child: const MyApp(),
      )
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final countProvider = context.watch<CounterProvider2>();
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.isDark ? ThemeMode.dark: ThemeMode.light,
      home: Scaffold(
      body: Center(
        child:Column(
          children: [
            Text("${countProvider.count}"),
            ElevatedButton(onPressed: (){
              context.read<CounterProvider2>().increment();
            }, child: Icon(Icons.add)),
            ElevatedButton(onPressed: (){
              context.read<ThemeProvider>().toggle();
            }, child: Icon(Icons.add))
          ],
        )
      ),
      )
    );
  }
}