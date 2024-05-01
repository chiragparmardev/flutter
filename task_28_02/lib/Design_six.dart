import 'package:flutter/material.dart';

class DesignSix extends StatelessWidget {
  const DesignSix({super.key});

  @override
  Widget build(BuildContext context) {
    final highsize = MediaQuery.of(context).size.height;
    final widthsize = MediaQuery.of(context).size.width;
    final textscale = MediaQuery.of(context).textScaler;
    Orientation currentOrientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  "Hight = $highsize",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "Width = $widthsize",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Image.network(
                  "https://miro.medium.com/v2/resize:fit:440/format:webp/1*ByROlt2vX4IB4L3VFrGCiQ.gif",
                ),
                Text(
                  "Screen orientaion = ${currentOrientation.name}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "Screen textScale = ${MediaQuery.textScalerOf(context)}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
