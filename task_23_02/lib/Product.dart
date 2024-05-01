// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Product {
  String imgUrl;
  String name;
  double price;

  Product(this.imgUrl, this.name, this.price);
}

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Product> productList = [
    Product(
        'https://rukminim2.flixcart.com/image/850/1000/xif0q/keyboard/desktop-keyboard/w/l/6/gaming-keyboard-with-87-keys-rgb-backlit-with-suspension-keys-original-imagzcgwtrabgjna.jpeg?q=20&crop=false',
        'Asus Rog Falchion Keyboard Mechanical KeyBoard',
        20.12),
    Product(
        'https://rukminim2.flixcart.com/image/850/1000/xif0q/keyboard/desktop-keyboard/w/l/6/gaming-keyboard-with-87-keys-rgb-backlit-with-suspension-keys-original-imagzcgwtrabgjna.jpeg?q=20&crop=false',
        'Asus Rog Falchion Keyboard Mechanical KeyBoard',
        30.12),
    Product(
        'https://rukminim2.flixcart.com/image/850/1000/xif0q/keyboard/desktop-keyboard/w/l/6/gaming-keyboard-with-87-keys-rgb-backlit-with-suspension-keys-original-imagzcgwtrabgjna.jpeg?q=20&crop=false',
        'Asus Rog Falchion Keyboard Mechanical KeyBoard',
        20.12),
    Product(
        'https://rukminim2.flixcart.com/image/850/1000/xif0q/keyboard/desktop-keyboard/w/l/6/gaming-keyboard-with-87-keys-rgb-backlit-with-suspension-keys-original-imagzcgwtrabgjna.jpeg?q=20&crop=false',
        'Asus Rog Falchion Keyboard Mechanical KeyBoard',
        20.12),
    Product(
        'https://rukminim2.flixcart.com/image/850/1000/xif0q/keyboard/desktop-keyboard/w/l/6/gaming-keyboard-with-87-keys-rgb-backlit-with-suspension-keys-original-imagzcgwtrabgjna.jpeg?q=20&crop=false',
        'Asus Rog Falchion Keyboard Mechanical KeyBoard',
        20.12),
    Product(
        'https://rukminim2.flixcart.com/image/850/1000/xif0q/keyboard/desktop-keyboard/w/l/6/gaming-keyboard-with-87-keys-rgb-backlit-with-suspension-keys-original-imagzcgwtrabgjna.jpeg?q=20&crop=false',
        'Asus Rog Falchion Keyboard Mechanical KeyBoard',
        20.12),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Mechanical Keyboard'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  UiHelper.filter(1, 'All'),
                  UiHelper.filter(0, 'Razor'),
                  UiHelper.filter(0, 'Hp'),
                  UiHelper.filter(0, 'Asus'),
                  UiHelper.filter(0, 'Lenovo'),
                  UiHelper.filter(0, 'Dell'),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              '385 Product(s) found',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: productList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (0.3 / 0.45),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          productList[index].imgUrl != null
                              ? Image.network(
                                  productList[index].imgUrl,
                                  fit: BoxFit.cover,
                                  height: 120,
                                  width: double.infinity,
                                  loadingBuilder: (context, child, progress) {
                                    if (progress == null) {
                                      return child;
                                    } else {
                                      return Container(
                                          height: 120,
                                          child: Center(
                                              child:
                                                  CircularProgressIndicator()));
                                    }
                                  },
                                )
                              : Container(
                                  height: 120,
                                  child: Center(
                                      child: CircularProgressIndicator())),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            productList[index].name,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            '\$ ${productList[index].price}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue),
                              clipBehavior: Clip.hardEdge,
                              child: Material(
                                color: Colors.transparent,
                                child: Ink(
                                  child: InkWell(
                                    onTap: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Selected Item price ${productList[index].price}')));
                                    },
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.shopping_basket,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Add to cart',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class UiHelper {
  static filter(int active, String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        decoration: BoxDecoration(
            color: active == 0 ? Colors.grey[300] : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: Colors.grey.shade400)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Center(child: Text(title)),
        ),
      ),
    );
  }
}
