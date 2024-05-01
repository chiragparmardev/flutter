// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomRowColum extends StatefulWidget {
  const BottomRowColum({super.key});

  @override
  State<BottomRowColum> createState() => _BottomRowColumState();
}

class _BottomRowColumState extends State<BottomRowColum> {
  final controller = PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreen() {
    return [
      BorromRowColumnFirst(),
      BottomRowColumSecond(),
      BottomRowColumThree(),
      BottomRowColumFour(),
      BottomRowColumFive()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItem() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.blue[900],
            size: 30,
          ),
          inactiveIcon: Icon(
            Icons.home_filled,
            color: Colors.grey,
            size: 30,
          )),
      PersistentBottomNavBarItem(
          icon: Icon(
            Icons.arrow_upward,
            color: Colors.blue[900],
            size: 30,
          ),
          inactiveIcon: Icon(
            Icons.arrow_upward,
            color: Colors.grey,
            size: 30,
          )),
      PersistentBottomNavBarItem(
          icon: Icon(
            Icons.add,
            color: Colors.blue[900],
            size: 30,
          ),
          inactiveIcon: Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          )),
      PersistentBottomNavBarItem(
          icon: Icon(
            Icons.arrow_downward,
            color: Colors.blue[900],
            size: 30,
          ),
          inactiveIcon: Icon(
            Icons.arrow_downward,
            color: Colors.grey,
            size: 30,
          )),
      PersistentBottomNavBarItem(
          icon: Icon(
            Icons.settings,
            color: Colors.blue[900],
            size: 30,
          ),
          inactiveIcon: Icon(
            Icons.settings,
            color: Colors.grey,
            size: 30,
          )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreen(),
      items: _navBarItem(),
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(1),
      ),
      navBarStyle: NavBarStyle.style15,
    );
  }
}

class BorromRowColumnFirst extends StatelessWidget {
  const BorromRowColumnFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: Container(
            height: 200,
            color: Colors.red,
            child: Center(child: Text('red')),
          )),
          Expanded(
              child: Container(
            height: 200,
            color: Colors.yellow,
            child: Center(child: Text('yellow')),
          )),
          Expanded(
              child: Container(
            height: 200,
            color: Colors.blue,
            child: Center(child: Text('blue')),
          )),
          Expanded(
              child: Container(
            height: 200,
            color: Colors.green,
            child: Center(child: Text('green')),
          ))
        ],
      ),
    );
  }
}

class BottomRowColumSecond extends StatelessWidget {
  const BottomRowColumSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            width: 200,
            color: Colors.red,
            child: Center(child: Text('red')),
          )),
          Expanded(
              child: Container(
            width: 200,
            color: Colors.yellow,
            child: Center(child: Text('yellow')),
          )),
          Expanded(
              child: Container(
            width: 200,
            color: Colors.blue,
            child: Center(child: Text('blue')),
          )),
          Expanded(
              child: Container(
            width: 200,
            color: Colors.green,
            child: Center(child: Text('green')),
          ))
        ],
      ),
    );
  }
}

class BottomRowColumThree extends StatelessWidget {
  const BottomRowColumThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
              child: Center(
            child: Text('Colors'),
          )),
          Flexible(
            child: Column(
              children: [
                Flexible(
                  child: Container(
                    color: Colors.orange,
                    child: Center(child: Text('red')),
                  ),
                ),
                Flexible(
                  child: Stack(children: [
                    Container(
                      color: Colors.white,
                    ),
                    Flexible(
                      child: Align(
                          alignment: Alignment.center,
                          child: Image(
                              image: AssetImage('assets/images/flag.png'))),
                    )
                  ]),
                ),
                Flexible(
                  child: Container(
                    color: Colors.green,
                    child: Center(child: Text('red')),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
              child: Center(
            child: Text('What is your favorite Color?'),
          )),
        ],
      ),
    );
  }
}

class BottomRowColumFour extends StatelessWidget {
  const BottomRowColumFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 8,
              child: Container(
                width: 200,
                color: Colors.red,
                child: Center(child: Text('red')),
              )),
          Expanded(
              child: Container(
            width: 200,
            color: Colors.yellow,
            child: Center(child: Text('yellow')),
          )),
          Expanded(
              child: Container(
            width: 200,
            color: Colors.blue,
            child: Center(child: Text('blue')),
          )),
          Expanded(
              child: Container(
            width: 200,
            color: Colors.green,
            child: Center(child: Text('green')),
          ))
        ],
      ),
    );
  }
}

class BottomRowColumFive extends StatelessWidget {
  const BottomRowColumFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
              child: Center(
            child: Text('Colors'),
          )),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 200,
                    color: Colors.red,
                    child: Center(child: Text('red')),
                  )),
                  Expanded(
                      child: Container(
                    height: 200,
                    color: Colors.yellow,
                    child: Center(child: Text('yellow')),
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 200,
                    color: Colors.blue,
                    child: Center(child: Text('blue')),
                  )),
                  Expanded(
                      child: Container(
                    height: 200,
                    color: Colors.green,
                    child: Center(child: Text('green')),
                  ))
                ],
              ),
            ],
          ),
          Flexible(
              child: Center(
            child: Text('What is your favorite Color?'),
          )),
        ],
      ),
    );
  }
}
