import 'package:flutter/material.dart';

class Product {
  Color color;
  String title;

  Product(this.color, this.title);
}

List<Product> productList = [
  Product(Colors.blue, 'W1'),
  Product(Colors.red, 'W2'),
  Product(Colors.green, 'W3'),
  Product(Colors.blue.shade900, 'W4'),
  Product(Colors.yellow.shade800, 'W5'),
  Product(Colors.blue.shade900, 'W6'),
  Product(Colors.yellow.shade800, 'W7'),
];

class DesignTwo extends StatelessWidget {
  const DesignTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        spacing: 10,
        runSpacing: 10,
        // alignment: WrapAlignment.spaceBetween,
        direction: Axis.vertical,
        verticalDirection: VerticalDirection.up,
        children: List.generate(
            productList.length,
            (index) => Container(
                  height: 150,
                  width: 150,
                  color: productList[index].color,
                  child: Center(
                    child: Text(
                      productList[index].title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                )),
      ),
    );
  }
}
