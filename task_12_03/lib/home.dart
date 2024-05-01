import 'package:flutter/material.dart';
import 'package:task_12_03/design_one.dart';
import 'package:task_12_03/design_two.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DesignOne()));
                },
                child: const Text('Design 1')),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DesignTwo()));
                },
                child: const Text('Design 2'))
          ],
        ),
      ),
    );
  }
}
