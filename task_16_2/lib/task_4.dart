// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RowColumFlex extends StatefulWidget {
  const RowColumFlex({super.key});

  @override
  State<RowColumFlex> createState() => _RowColumFlexState();
}

class _RowColumFlexState extends State<RowColumFlex> {
  int selectedIndex = 0;

  List<Widget> pages = [
    RowColumFlexFirst(),
    RowColumFlexSecond(),
    RowColumFlexThird(),
    Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(10)),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Center(
          child: pages.elementAt(selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.music_note,
              color: Colors.purple,
            ),
            label: "Music",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.place,
              color: Colors.blue,
            ),
            label: "Places",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.newspaper,
              color: Colors.yellow,
            ),
            label: "News",
          ),
        ],
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
        currentIndex: selectedIndex,
        elevation: 20,
        selectedFontSize: 15,
        selectedItemColor: Colors.black,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
    );
  }
}

class RowColumFlexFirst extends StatelessWidget {
  const RowColumFlexFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFF2AA650),
                    borderRadius: BorderRadius.circular(10)),
              )),
          SizedBox(
            height: 5,
          ),
          Flexible(
            flex: 2,
            child: Row(
              children: [
                Flexible(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff58aaE8),
                      borderRadius: BorderRadius.circular(10)),
                )),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffE74e33),
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Flexible(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff8d43b3),
                    borderRadius: BorderRadius.circular(10)),
              )),
          SizedBox(
            height: 5,
          ),
          Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff58aaE8),
                    borderRadius: BorderRadius.circular(10)),
              )),
        ],
      ),
    );
  }
}

class RowColumFlexSecond extends StatelessWidget {
  const RowColumFlexSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff8d43b3),
                    borderRadius: BorderRadius.circular(10)),
              )),
          SizedBox(
            height: 5,
          ),
          Flexible(
            flex: 2,
            child: Row(
              children: [
                Flexible(
                    child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF2AA650),
                  ),
                )),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Column(
                    children: [
                      Flexible(
                          child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff58aaE8),
                            borderRadius: BorderRadius.circular(10)),
                      )),
                      SizedBox(
                        height: 5,
                      ),
                      Flexible(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xffE74e33),
                                borderRadius: BorderRadius.circular(10)),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFF2AA650),
                    borderRadius: BorderRadius.circular(10)),
              )),
        ],
      ),
    );
  }
}

class RowColumFlexThird extends StatelessWidget {
  const RowColumFlexThird({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Row(
              children: [
                Flexible(
                    child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF2AA650),
                  ),
                )),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Column(
                    children: [
                      Flexible(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xff58aaE8),
                                borderRadius: BorderRadius.circular(10)),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Flexible(
                          flex: 4,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xffE74e33),
                                borderRadius: BorderRadius.circular(10)),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff8d43b3),
                    borderRadius: BorderRadius.circular(10)),
              )),
        ],
      ),
    );
  }
}
