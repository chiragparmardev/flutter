import 'package:flutter/material.dart';
import 'package:task_6_03/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: const TextTheme(
            titleMedium: TextStyle(fontSize: 22, color: Colors.white),
            bodyMedium: TextStyle(fontSize: 17, color: Colors.blue),
            bodySmall: TextStyle(fontSize: 17, color: Colors.black),
            headlineMedium: TextStyle(fontSize: 20, color: Colors.white),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const HomePage());
  }
}
