import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class StreamBuilderPage extends StatefulWidget {
  const StreamBuilderPage({super.key});

  @override
  StreamBuilderPageState createState() => StreamBuilderPageState();
}

class StreamBuilderPageState extends State<StreamBuilderPage> {
  StreamController<int> streamController = StreamController<int>();
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      final random = Random();
      streamController.add(random.nextInt(50));
    });
  }

  @override
  void dispose() {
    streamController.close();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Number Stream'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: streamController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                'Random Number = ${snapshot.data}',
                style: const TextStyle(fontSize: 24),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
