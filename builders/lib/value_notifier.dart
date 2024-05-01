import 'package:flutter/material.dart';

class ValNotCount extends StatelessWidget {
  const ValNotCount({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> counterNotifier = ValueNotifier<int>(0);

    return Scaffold(
        body: Center(
          child: ValueListenableBuilder<int>(
            valueListenable: counterNotifier,
            builder: (context, value, child) {
              return Text(
                'Counter: $value',
                style: const TextStyle(fontSize: 24),
              );
            },
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                counterNotifier.value++;
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              onPressed: () {
                counterNotifier.value = 0;
              },
              child: const Icon(Icons.refresh),
            ),
          ],
        ));
  }
}
