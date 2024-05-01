import 'package:flutter/material.dart';

class DesignFirst extends StatelessWidget {
  const DesignFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: Colors.green,
      ),
      Container(
        height: 300,
        width: 300,
        color: Colors.blue,
      ),
      Container(
        height: 150,
        width: 150,
        color: Colors.red,
      ),
    ]);
  }
}
