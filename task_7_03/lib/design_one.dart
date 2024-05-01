import 'package:flutter/material.dart';

class DesignOne extends StatefulWidget {
  const DesignOne({super.key});

  @override
  State<DesignOne> createState() => _MyDesignOneState();
}

class _MyDesignOneState extends State<DesignOne>
    with SingleTickerProviderStateMixin {
  List<Widget> widgets = [
    // const Screen1day6(),
    Container(
      color: Colors.blue,
      child: const Center(
        child: Text(
          'Home',
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
      ),
    ),
    Container(
      color: Colors.green,
      child: const Center(
        child: Text(
          'Shop',
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
      ),
    ),
    Container(
      color: Colors.red,
      child: const Center(
        child: Text(
          'News',
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
      appBar: AppBar(
        title: const Text('KindaCode.com'),
        centerTitle: true,
        bottom: TabBar(
            labelPadding: const EdgeInsets.only(bottom: 10),
            controller: controller,
            tabs: const [
              Icon(
                Icons.home,
                size: 30,
              ),
              Icon(
                Icons.shop,
                size: 30,
              ),
              Icon(
                Icons.newspaper_outlined,
                size: 30,
              )
            ]),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          TabBarView(controller: controller, children: widgets),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: TabPageSelector(
                  color: Colors.grey,
                  selectedColor: Colors.white,
                  indicatorSize: 25,
                  controller: controller,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
