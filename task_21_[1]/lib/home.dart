import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  List<Widget> pages = [FirstPage(), SecondPage(), ThirdPage(), FourthPage()];

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
              Icons.home,
            ),
            label: "First",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.movie,
            ),
            label: "Second",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.photo_album,
            ),
            label: "Third",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Fourth",
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

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: AlignedGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    height: 40,
                    color: Colors.red,
                    child: Center(child: Text('Hello')),
                  );
                }))
      ],
    ));
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> Items = [
      UiHelper.SecondItem(0, Colors.blue),
      UiHelper.SecondItem(1, Colors.blue),
      UiHelper.SecondItem(2, Colors.blue),
      UiHelper.SecondItem(3, Colors.blue),
      UiHelper.SecondItem(4, Colors.blue),
      UiHelper.SecondItem(5, Colors.blue),
      UiHelper.SecondItem(6, Colors.blue),
      UiHelper.SecondItem(7, Colors.blue),
      UiHelper.SecondItem(8, Colors.blue),
      UiHelper.SecondItem(9, Colors.blue),
      UiHelper.SecondItem(10, Colors.blue),
      UiHelper.SecondItem(11, Colors.blue),
      UiHelper.SecondItem(12, Colors.blue),
      UiHelper.SecondItem(13, Colors.blue),
      UiHelper.SecondItem(14, Colors.blue),
      UiHelper.SecondItem(15, Colors.blue),
      UiHelper.SecondItem(16, Colors.blue),
      UiHelper.SecondItem(17, Colors.blue),
    ];
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: [
              StaggeredGridTile.count(
                  crossAxisCellCount: 2, mainAxisCellCount: 2, child: Items[0]),
              StaggeredGridTile.count(
                  crossAxisCellCount: 1, mainAxisCellCount: 1, child: Items[1]),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Items[2],
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: Items[3],
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: Items[4],
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: Items[5],
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Items[6],
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Items[7],
              ),
              // StaggeredGridTile.count(
              //   crossAxisCellCount: 2,
              //   mainAxisCellCount: 2,
              //   child: Items[8],
              // ),
              // StaggeredGridTile.count(
              //   crossAxisCellCount: 1,
              //   mainAxisCellCount: 1,
              //   child: Items[9],
              // ),
              // StaggeredGridTile.count(
              //   crossAxisCellCount: 1,
              //   mainAxisCellCount: 1,
              //   child: Items[10],
              // ),
              // StaggeredGridTile.count(
              //   crossAxisCellCount: 2,
              //   mainAxisCellCount: 1,
              //   child: Items[11],
              // ),
              // StaggeredGridTile.count(
              //   crossAxisCellCount: 2,
              //   mainAxisCellCount: 1,
              //   child: Items[12],
              // ),
              // StaggeredGridTile.count(
              //   crossAxisCellCount: 2,
              //   mainAxisCellCount: 2,
              //   child: Items[13],
              // ),
              // StaggeredGridTile.count(
              //   crossAxisCellCount: 1,
              //   mainAxisCellCount: 1,
              //   child: Items[14],
              // ),
              // StaggeredGridTile.count(
              //   crossAxisCellCount: 1,
              //   mainAxisCellCount: 1,
              //   child: Items[15],
              // ),
            ],
          ))
        ],
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
          child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children:
            //  [

            List.generate(
          8,
          (index) => staggeredgridTile(index),
        ),

        //   StaggeredGridTile.count(
        //     crossAxisCellCount: 2,
        //     mainAxisCellCount: 2,
        //     child:Items[0]
        // ),
        //     StaggeredGridTile.count(
        //         crossAxisCellCount: 2,
        //         mainAxisCellCount: 1,
        //         child:Items[1]
        //     ),
        //     StaggeredGridTile.count(
        //         crossAxisCellCount: 2,
        //         mainAxisCellCount: 2,
        //         child:Items[2]
        //     ),
        //     StaggeredGridTile.count(
        //         crossAxisCellCount: 2,
        //         mainAxisCellCount: 1,
        //         child:Items[3]
        //     ),
        //     StaggeredGridTile.count(
        //         crossAxisCellCount: 2,
        //         mainAxisCellCount: 2,
        //         child:Items[4]
        //     ),
        //     StaggeredGridTile.count(
        //         crossAxisCellCount: 2,
        //         mainAxisCellCount: 1,
        //         child:Items[5]
        //     ),
        //     StaggeredGridTile.count(
        //         crossAxisCellCount: 2,
        //         mainAxisCellCount: 2,
        //         child:Items[6]
        //     ),
        //     StaggeredGridTile.count(
        //         crossAxisCellCount: 2,
        //         mainAxisCellCount: 1,
        //         child:Items[7]
        //     ),
        // ]
      ))
    ]));
  }

  Widget staggeredgridTile(int i) {
    final bool isEven = i.isEven;

    final int cc = isEven ? 2 : 2;
    final int mc = isEven ? 2 : 1;

    return StaggeredGridTile.count(
      crossAxisCellCount: cc,
      mainAxisCellCount: mc,
      child: Container(
        color: Colors.green,
        child: Center(
          child: CircleAvatar(
            child: Text("$i"),
          ),
        ),
      ),
    );
  }
}

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> Items = [
      UiHelper.FirstItem(Icons.menu, Colors.green),
      UiHelper.FirstItem(Icons.wifi, Colors.blue),
      UiHelper.FirstItem(Icons.gif_box, Colors.yellow),
      UiHelper.FirstItem(Icons.park, Colors.greenAccent),
      UiHelper.FirstItem(Icons.send, Colors.orange),
      UiHelper.FirstItem(Icons.laptop, Colors.blue.shade900),
      UiHelper.FirstItem(Icons.bluetooth, Colors.orangeAccent),
      UiHelper.FirstItem(Icons.battery_0_bar, Colors.red),
      UiHelper.FirstItem(Icons.cast, Colors.purple),
      UiHelper.FirstItem(Icons.radio, Colors.blue),
    ];
    return Scaffold(
        body: Column(children: [
      Expanded(
          child: StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: [
            StaggeredGridTile.count(
                crossAxisCellCount: 2, mainAxisCellCount: 2, child: Items[0]),
            StaggeredGridTile.count(
                crossAxisCellCount: 2, mainAxisCellCount: 1, child: Items[1]),
            StaggeredGridTile.count(
                crossAxisCellCount: 1, mainAxisCellCount: 2, child: Items[2]),
            StaggeredGridTile.count(
                crossAxisCellCount: 1, mainAxisCellCount: 1, child: Items[3]),
            StaggeredGridTile.count(
                crossAxisCellCount: 2, mainAxisCellCount: 2, child: Items[4]),
            StaggeredGridTile.count(
                crossAxisCellCount: 1, mainAxisCellCount: 2, child: Items[5]),
            StaggeredGridTile.count(
                crossAxisCellCount: 1, mainAxisCellCount: 1, child: Items[6]),
            StaggeredGridTile.count(
                crossAxisCellCount: 3, mainAxisCellCount: 1, child: Items[7]),
            StaggeredGridTile.count(
                crossAxisCellCount: 1, mainAxisCellCount: 1, child: Items[8]),
            StaggeredGridTile.count(
                crossAxisCellCount: 4, mainAxisCellCount: 1, child: Items[9]),
          ])),
    ]));
  }
}

class UiHelper {
  static SecondItem(int id, Color color) {
    return Container(
      color: color,
      child: Center(
        child: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: Text(id.toString()),
        ),
      ),
    );
  }

  static FirstItem(IconData icon, Color color) {
    return Container(
      color: color,
      child: Center(
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
