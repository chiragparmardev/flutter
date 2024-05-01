import 'package:flutter/material.dart';

class DesignThree extends StatelessWidget {
  const DesignThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: const Text(
          'Wrap widget',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: 100,
        color: Colors.red,
        child: const Text(
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
