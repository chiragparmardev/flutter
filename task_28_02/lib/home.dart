import 'package:flutter/material.dart';
import 'package:task_28_02/Design_six.dart';
import 'package:task_28_02/design_first.dart';
import 'package:task_28_02/design_five.dart';
import 'package:task_28_02/design_four.dart';
import 'package:task_28_02/design_three.dart';
import 'package:task_28_02/design_two.dart';

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
                          builder: (context) => const DesignFirst()));
                },
                child: const Text('Design 1')),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DesignTwo()));
                },
                child: const Text('Design 2')),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DesignThree()));
                },
                child: const Text('Design 3')),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DesignFour()));
                },
                child: const Text('Design 4')),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DesignFive()));
                },
                child: const Text('Design 5')),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DesignSix()));
                },
                child: const Text('Design 6'))
          ],
        ),
      ),
    );
  }
}
