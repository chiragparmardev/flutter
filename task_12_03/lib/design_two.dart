import 'package:flutter/material.dart';
import 'package:task_12_03/two_home.dart';

class DesignTwo extends StatefulWidget {
  const DesignTwo({super.key});

  @override
  State<DesignTwo> createState() => _DesignTwoState();
}

class _DesignTwoState extends State<DesignTwo> {
  int selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> widgetOptions = <Widget>[
    // const FirstScreenGridView(),
    Container(
      child: Center(child: Text('Geeks for Geeks')),
      height: 100,
      width: 250,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.green,
          ),
          BoxShadow(
            color: Colors.white70,
            spreadRadius: -5.0,
            blurRadius: 20.0,
          ),
        ],
      ),
    ),
    const Center(
      child: Text(
        'Index 1: List',
        style: optionStyle,
      ),
    ),
    const Center(
      child: Text(
        'Index 2: Chat',
        style: optionStyle,
      ),
    ),
    const Center(
      child: Text(
        'Index 3: Search',
        style: optionStyle,
      ),
    ),
    const Center(
      child: Text(
        'Index 4: Person',
        style: optionStyle,
      ),
    ),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TwoHome()));
          },
          child: Image.asset(
            "assets/images/logo.jpeg",
            height: 70,
          ),
        ),
      ),
      body: widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_sharp),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'School',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.purple[700],
        unselectedItemColor: Colors.grey,
        onTap: onItemTapped,
      ),
    );
  }
}

class FirstScreenGridView extends StatefulWidget {
  const FirstScreenGridView({super.key});

  @override
  State<FirstScreenGridView> createState() => _FirstScreenGridViewState();
}

class _FirstScreenGridViewState extends State<FirstScreenGridView> {
  Map<IconData, List<String>> card = {
    Icons.shopping_cart_outlined: ['Buying'],
    Icons.store_mall_directory_outlined: ['Selling'],
    Icons.shop_sharp: ['Trade'],
    Icons.ondemand_video_rounded: ['Video'],
    Icons.local_offer_sharp: ['Deal'],
    Icons.menu_book_outlined: ['Case Study'],
  };

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.grey.shade200,  boxShadow: [
            BoxShadow(
            color: Colors.green,
          ),
          BoxShadow(
            color: Colors.red,
            spreadRadius: -5.0,
            blurRadius: 20.0,
          ),
          ],),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Choose your Area',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .7,
                  child: GridView.builder(
                    itemCount: card.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: selectedIndex == index
                                ? Colors.deepPurple
                                : Colors.white,
                            boxShadow: [
                              selectedIndex == index
                                  ? BoxShadow(
                                      color: Colors.deepPurple.shade100,
                                      blurRadius: 5.0,
                                      offset: const Offset(0.0, 10.90))
                                  : const BoxShadow()
                            ],
                          ),
                          margin: const EdgeInsets.all(10),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  card.keys.elementAt(index),
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.purple[800],
                                  size: 45,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  card.values.elementAt(index)[0],
                                  style: TextStyle(
                                      color: selectedIndex == index
                                          ? Colors.white
                                          : Colors.black38,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
