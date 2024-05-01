import 'dart:async';

import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  late StreamController<int> controller;
  late int counter;

  @override
  void initState() {
    super.initState();
    controller = StreamController<int>(
        // onPause: () {
        //   print("Stream is paused");
        // },
        );
    start();
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  Future<void> start() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        counter = 0;
        controller.add(counter);
      },
    );
  }

  void incrementCounter() {
    counter++;
    controller.add(counter);
  }

  void stopCounter() {
    counter = 0;
    controller.add(counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Counter App"),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            shape: const StadiumBorder(side: BorderSide(color: Colors.green)),
            heroTag: 'play',
            onPressed: incrementCounter,
            child: const Icon(
              Icons.add,
              color: Colors.green,
            ),
          ),
          FloatingActionButton(
            shape: const StadiumBorder(side: BorderSide(color: Colors.red)),
            heroTag: 'pause',
            onPressed: stopCounter,
            child: const Icon(
              Icons.restart_alt_rounded,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: StreamBuilder(
        stream: controller.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text(
                "Counter = ${counter.toString()}",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            );
          }
        },
      ),
    );
  }
}
