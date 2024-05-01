// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DesignThree extends StatelessWidget {
  String networkimage =
      'https://wallpapers.com/images/featured/laptop-murjp1nk4lp1idlt.jpg';
  DesignThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: const Text(
          'Flutterassets.com',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(children: [
        Container(
          height: 120,
          width: double.infinity,
          color: Colors.grey[200],
        ),
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
            networkimage,
          ),
        ),
        const Positioned(
            top: 70,
            left: 70,
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 15,
              child: Text(
                "1",
                style: TextStyle(color: Colors.white),
              ),
            )),
      ]),
    );
  }
}
