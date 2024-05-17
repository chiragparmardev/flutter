import 'package:flutter/material.dart';
import 'package:p1/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountPage extends StatelessWidget {
  const CountPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final consumer = Provider.of<CountProvider>(context);

    return Scaffold(
      body: Center(child: Consumer<CountProvider>(
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    value.increaseCount();
                  },
                  icon: const Icon(Icons.add)),
              Text(value.count.toString()),
              IconButton(
                  onPressed: () {
                    value.decreaseCount();
                  },
                  icon: const Icon(Icons.remove))
            ],
          );
        },
      )),
    );
  }
}
