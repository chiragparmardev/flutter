import 'package:flutter/material.dart';
import 'package:task_27_03/Data/ice_crean_data.dart';
import 'package:task_27_03/Data/milk_data.dart';
import 'package:task_27_03/Data/snacks_data.dart';
import 'package:task_27_03/gen/assets.gen.dart';

class Category {
  final String title;
  final Image imgUrl;
  final List<List>? products;

  Category({required this.title, required this.imgUrl, this.products});
}

List<Category> categoryData = [
  Category(
    title: 'Dairy & Eggs',
    imgUrl: Assets.images.milkBox.image(),
    products: [
      milkData,
      iceCreamData,
    ],
  ),
  Category(title: 'Snacks', imgUrl: Assets.images.food1.image(), products: [
    snaksData,
  ]),
  Category(
    title: 'Seafood',
    imgUrl: Assets.images.pancakes.image(),
  ),
  Category(
    title: 'Frozen Foods',
    imgUrl: Assets.images.spaghetti.image(),
  ),
  Category(
    title: 'Cold',
    imgUrl: Assets.images.iceCream.image(),
  ),
  Category(
    title: 'Vegetables',
    imgUrl: Assets.images.vegetables.image(),
  ),
  Category(
    title: 'Milk',
    imgUrl: Assets.images.milk.image(),
  ),
  Category(
    title: 'Pizza',
    imgUrl: Assets.images.pizza.image(),
  ),
];
