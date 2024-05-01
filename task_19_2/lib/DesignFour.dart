import 'package:flutter/material.dart';

class DesignFour extends StatelessWidget {
  const DesignFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: const Text(
          'Stack ',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(children: [
        Container(width: 200, height: 200, color: Colors.red),
        Positioned(
            child: Container(
          height: 150,
          width: 150,
          color: Colors.blue,
        )),
        Positioned(
            child: Container(
          height: 100,
          width: 100,
          color: Colors.green,
        )),
      ]),
    );
  }
}
