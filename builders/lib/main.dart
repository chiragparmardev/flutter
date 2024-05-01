import 'package:builders/stream_future.dart';
import 'package:builders/task_11.dart';
import 'package:builders/value_notifier.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const StreamBuilderPage());
        // home: const CounterApp());
        home: const ValNotCount());
  }
}
