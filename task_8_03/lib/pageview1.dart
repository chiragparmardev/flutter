import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class PageViewOne extends StatelessWidget {
  PageViewOne({Key? key}) : super(key: key);

  List<StaggeredTile> staggered_tile = [
    const StaggeredTile.count(4, 1),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(4, 2),
    const StaggeredTile.count(2, 4),
    const StaggeredTile.count(2, 4),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            padding: const EdgeInsets.all(8),
            child: StaggeredGridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              staggeredTiles: staggered_tile,
              children: [
                Container(
                  color: Colors.blue.shade800,
                ),
                Container(
                  color: Colors.blue,
                ),
                Container(
                  color: Colors.blue,
                ),
                Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  child: const Text(
                    "PageView 1",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                Container(
                  color: Colors.blue,
                ),
                Container(
                  color: Colors.blue,
                ),
              ],
            )),
      ),
    );
  }
}
