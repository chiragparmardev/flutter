// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BasicPage extends StatelessWidget {
  const BasicPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<StaggeredGridTile> basicItem = [
      StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 2,
          child: UiHelper.ImageStyle(
              'https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?cs=srgb&dl=pexels-james-wheeler-414612.jpg&fm=jpg')),
      StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 2,
          child: UiHelper.ImageStyle(
              'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg')),
      StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 2,
          child: UiHelper.ImageStyle(
              'https://cdn.pixabay.com/photo/2016/05/05/02/37/sunset-1373171_1280.jpg')),
      StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 2,
          child: UiHelper.ImageStyle(
              'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg')),
      StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 2,
          child: UiHelper.ImageStyle(
              'https://deep-image.ai/blog/content/images/2022/09/underwater-magic-world-8tyxt9yz.jpeg')),
      StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 2,
          child: UiHelper.ImageStyle(
              'https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg')),
      StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 2,
          child: UiHelper.ImageStyle(
              'https://media.istockphoto.com/id/517188688/photo/mountain-landscape.jpg?s=612x612&w=0&k=20&c=A63koPKaCyIwQWOTFBRWXj_PwCrR4cEoOw2S9Q7yVl8=')),
      StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 2,
          child: UiHelper.ImageStyle(
              'https://sensip.engineering.asu.edu/wp-content/uploads/2012/08/neural_networking.jpg')),
    ];

    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: ListView(children: [
              StaggeredGrid.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: basicItem),
            ])));
  }
}

class UiHelper {
  static ImageStyle(String img) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(img, fit: BoxFit.fill));
  }
}
