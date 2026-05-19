import 'package:flutter/material.dart';

import 'package:my_first_app/providers/counterProvider.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(ChangeNotifierProvider(create: (_) => themeProvider(),
  child: const myApp(),));
}
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeP = context.watch<themeProvider>();
    final isDark = context.watch<themeProvider>().isDarkMode;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeP.themeMode,
      home: Scaffold(
      appBar: AppBar(
        title: const Text("Theme Control"),
        actions: [
          IconButton(
            icon: Icon( isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              context.read<themeProvider>().toggleTheme();
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          'Current Theme: ${isDark ? "dark" : "light"}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    )
    );
  }
}