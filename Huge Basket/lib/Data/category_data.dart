import 'package:task_27_03/Data/ice_crean_data.dart';
import 'package:task_27_03/Data/milk_data.dart';
import 'package:task_27_03/Data/snacks_data.dart';

class Category {
  final String title;
  final String imgUrl;
  final List<List>? products;

  Category({required this.title, required this.imgUrl, this.products});
}

List<Category> categoryData = [
  Category(
    title: 'Dairy & Eggs',
    imgUrl: 'assets/images/milk-box.png',
    products: [
      milkData,
      iceCreamData,
    ],
  ),
  Category(title: 'Snacks', imgUrl: 'assets/images/food1.png', products: [
    snaksData,
  ]),
  Category(title: 'Seafood', imgUrl: 'assets/images/pancakes.png'),
  Category(title: 'Frozen Foods', imgUrl: 'assets/images/spaghetti.png'),
  Category(title: 'Cold', imgUrl: 'assets/images/ice-cream.png'),
  Category(title: 'Vegetables', imgUrl: 'assets/images/vegetables.png'),
  Category(title: 'Milk', imgUrl: 'assets/images/milk.png'),
  Category(title: 'Pizza', imgUrl: 'assets/images/pizza.png'),
];
