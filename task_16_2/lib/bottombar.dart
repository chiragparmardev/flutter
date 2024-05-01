import 'package:flutter/material.dart';

class BottomBarCustom extends StatefulWidget {
  const BottomBarCustom({super.key});

  @override
  State<BottomBarCustom> createState() => _BottomBarCustomState();
}

class _BottomBarCustomState extends State<BottomBarCustom> {
  int selectedIndex = 0;

  List<Widget> pages = [
FirstHomePage(),
    Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(10)),
    ),
    Uihelper.Description(),
    Uihelper.Description(),
    Uihelper.Description(),
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
              Icons.home_filled,

            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.movie,
            ),
            label: "Reels",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.photo_album,
            ),
            label: "Gallery",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
            ),
            label: "Activity",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/1.jpg'),
            ),
            label: "Profile",
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

class FirstHomePage extends StatelessWidget {
  const FirstHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Example 1'),
            Uihelper.Description(),
            Uihelper.Description(),
            Uihelper.Description(),
            Uihelper.Description(),
            Uihelper.Description(),
          ],
        ),
      ),
    );
  }
}

class Uihelper{
  static Description (){
    return Padding(
    padding: const EdgeInsets.all(8.0),
  child: Row(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Text('●'),
  SizedBox(
  width: 5,
  ),
  Flexible(child: Text('A bottom navigation bar is uaually used in conjunction with a Scafold'))
  ],
  ),
  );
}
}
