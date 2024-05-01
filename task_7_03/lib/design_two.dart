import 'package:flutter/material.dart';

class DesignTwo extends StatefulWidget {
  const DesignTwo({super.key});

  @override
  State<DesignTwo> createState() => _DesignTwoState();
}

class _DesignTwoState extends State<DesignTwo>
    with SingleTickerProviderStateMixin {
  List<Widget> widgets = [
    Container(
      color: Colors.red,
      child: const Center(
        child: Text(
          'Page 1',
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
      ),
    ),
    Container(
      color: Colors.pink,
      child: const Center(
        child: Text(
          'Page 2',
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
      ),
    ),
    Container(
      color: Colors.purpleAccent,
      child: const Center(
        child: Text(
          'Page 3',
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
      ),
    ),
  ];

  late final TabController controller =
      TabController(length: widgets.length, initialIndex: index, vsync: this);
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: const BoxDecoration(color: Colors.white),
        height: 80,
        width: 450,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "MyLogo",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700),
            ),
            TabPageSelector(
              color: Colors.white,
              selectedColor: Colors.blue,
              indicatorSize: 18,
              controller: controller,
            ),
          ],
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          TabBarView(controller: controller, children: widgets),
          // Positioned(
          //   bottom: 0,
          //   child:
          // ),
        ],
      ),
    );
  }
}
