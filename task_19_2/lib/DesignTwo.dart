import 'package:flutter/material.dart';

class DesignTwo extends StatelessWidget {
  const DesignTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: const SizedBox(),
        title: const Text(
          "Stack Widget",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(children: [
        Positioned(
            top: 30,
            left: 30,
            child: Container(
              height: 200,
              width: 200,
              color: Colors.green,
              child: const Text('Green', style: TextStyle(color: Colors.white)),
            )),
        Positioned(
            top: 60,
            left: 60,
            child: Container(
              height: 200,
              width: 200,
              color: Colors.red,
              child: const Text('Red', style: TextStyle(color: Colors.white)),
            )),
        Positioned(
            top: 90,
            left: 90,
            child: Container(
              height: 200,
              width: 200,
              color: Colors.purple,
              child:
                  const Text('Purple', style: TextStyle(color: Colors.white)),
            )),
      ]),
    );
  }
}
