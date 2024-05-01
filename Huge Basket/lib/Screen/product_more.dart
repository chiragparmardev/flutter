import 'package:flutter/material.dart';
import 'package:task_27_03/Cutom/Appbar/appbar_custom.dart';
import 'package:task_27_03/Cutom/Widgets/custom_card_product.dart';
import 'package:task_27_03/Data/cart_data.dart';
import 'package:task_27_03/Utils/AppColor.dart';

class ShopItems {
  final List<dynamic> productList;
  final String shopName;

  ShopItems({
    required this.productList,
    required this.shopName,
  });
}

class ProductMore extends StatelessWidget {
  const ProductMore({super.key});

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as ShopItems;
    // print("============= $arguments");
    var productData = arguments.productList;
    String shopName = arguments.shopName;

    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount;

    crossAxisCount = screenWidth < 500
        ? 2
        : screenWidth < 700
            ? 3
            : screenWidth < 900
                ? 4
                : 5;

    int totalItems = 0;

    for (var shopMap in cartItems) {
      List<Items> shopItems = List<Items>.from(shopMap['items']);
      totalItems += shopItems.length;
    }

    return Scaffold(
      backgroundColor: AppColor.greyBg,
      appBar: uiHelper.customAppbarWithBackCart(
          () {
            Navigator.pop(context);
          },
          productData[0].category,
          () {
            null;
          },
          totalItems),
      body:
          // Text('data')
          Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 3 / 3.2),
            itemCount: productData.length,
            itemBuilder: (context, index) {
              return CustomCardProduct(
                indexProduct: productData,
                indexCardProduct: index,
                shopName: shopName,
              );
            }),
      ),
    );
  }
}
