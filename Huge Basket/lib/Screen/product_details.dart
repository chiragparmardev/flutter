import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:task_27_03/Cutom/Appbar/appbar_custom.dart';
import 'package:task_27_03/Data/cart_data.dart';
import 'package:task_27_03/Utils/AppColor.dart';
import 'package:task_27_03/Utils/Toast.dart';
import 'package:task_27_03/route_setting.dart';

class ProductDetailsArguments {
  final int index;
  final List<dynamic> productList;

  final String shopName;

  ProductDetailsArguments({
    required this.index,
    required this.productList,
    required this.shopName,
  });
}

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    int storeindex = arguments.index;
    List<dynamic> storelist = arguments.productList;
    String shopName = arguments.shopName;
    int price = int.parse(storelist[storeindex].price);

    List<String> images = [
      storelist[storeindex].imgUrl,
      'assets/images/milk-bottle.png',
      'assets/images/milk-box.png',
      'assets/images/ice-cream.png',
      'assets/images/pizza.png',
    ];
    int totalItems = 0;

    for (var shopMap in cartItems) {
      List<Items> shopItems = List<Items>.from(shopMap['items']);
      totalItems += shopItems.length;
    }
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColor.white,
      appBar: uiHelper.customAppbarWithBackCart(
          () {
            Navigator.pop(context);
          },
          "Product Details",
          () {
            Navigator.pushNamed(context, MyRouter.cart);
          },
          totalItems),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 317,
              width: double.infinity,
              color: AppColor.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 29,
                  ),
                  Center(
                    child: SizedBox(
                      height: 162,
                      width: double.infinity,
                      child: PageView.builder(
                        itemCount: images.length,
                        onPageChanged: (index) {
                          setState(() {
                            currentImageIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Image.asset(
                            images[index],
                            fit: BoxFit.contain,
                            width: 162,
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          images.length,
                          (index) => Padding(
                                padding:
                                    const EdgeInsets.only(left: 3, right: 3),
                                child: Container(
                                  width: 13,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: index == currentImageIndex
                                        ? AppColor.primary
                                        : AppColor.grey200,
                                  ),
                                ),
                              )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15, left: 20, right: 20, bottom: 18),
                    child: Text(
                      storelist[storeindex].subtitle,
                      style: TextStyle(
                          color: AppColor.textgGreyblack,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '\$ ${storelist[storeindex].count.value > 1 ? storelist[storeindex].count.value * price : price}',
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.black),
                        ),
                        storelist[storeindex].count.value == 0
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    storelist[storeindex].count.value = 1;
                                  });
                                },
                                child: DottedBorder(
                                  dashPattern: const [5, 5],
                                  padding: const EdgeInsets.all(0),
                                  color: AppColor.primary,
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(50),
                                  child: Container(
                                    height: 26,
                                    width: 26,
                                    decoration: BoxDecoration(
                                        color: AppColor.greenBg,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: const Icon(
                                      Icons.add,
                                      color: AppColor.primary,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                width: 103,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        width: 1, color: AppColor.primary)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 7, right: 7),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      storelist[storeindex].count.value == 1
                                          ? InkWell(
                                              onTap: () {
                                                setState(() {
                                                  storelist[storeindex]
                                                      .count
                                                      .value = 0;
                                                });
                                              },
                                              child: const Icon(
                                                Icons.delete_outline_outlined,
                                                color: Colors.red,
                                                size: 20,
                                              ),
                                            )
                                          : InkWell(
                                              onTap: () {
                                                setState(() {
                                                  storelist[storeindex]
                                                      .count
                                                      .value--;
                                                });
                                              },
                                              child: const Icon(
                                                Icons.remove,
                                                color: Colors.red,
                                                size: 20,
                                              ),
                                            ),
                                      Text(
                                        storelist[storeindex]
                                            .count
                                            .value
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.black,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            storelist[storeindex].count.value++;
                                          });
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          color: AppColor.black,
                                          size: 22,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                        Text(
                          '${storelist[storeindex].mg}',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColor.textgGreyblack),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 20,
              color: AppColor.greyShadow,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Details',
                    style: TextStyle(
                        color: AppColor.textgGreyblack,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem sum has been the industry's standard dummy text ever since the 1500s, when an unknown rinter ok a galley of type and scrambled it tomake a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      style: TextStyle(
                          color: AppColor.black.withOpacity(0.7),
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 95,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColor.white.withOpacity(0.4), AppColor.white])),
        child: Padding(
          padding:
              const EdgeInsets.only(bottom: 20, left: 40, right: 40, top: 20),
          child: Container(
            height: 52,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(50)),
            clipBehavior: Clip.hardEdge,
            child: Material(
              color: Colors.transparent,
              child: Ink(
                child: InkWell(
                  onTap: () {
                    if (storelist[storeindex].count.value == 0) {
                      Utility.showErrorMessage(
                          'Please select quantity', Colors.red);
                    } else {
                      Items item = Items(
                        imgUrl: storelist[storeindex].imgUrl,
                        name: storelist[storeindex].subtitle,
                        quantity: storelist[storeindex].count.value,
                        mg: storelist[storeindex].mg,
                        price: price,
                      );

                      int shopIndex = cartItems.indexWhere(
                          (element) => element['shopName'] == shopName);
                      if (shopIndex != -1) {
                        cartItems[shopIndex]['items'].add(item);
                      } else {
                        cartItems.add({
                          'shopName': shopName,
                          'items': [item],
                        });
                      }
                      setState(() {
                        storelist[storeindex].count.value = 0;
                      });
                      Utility.showErrorMessage(
                          'Product added to cart', Colors.green);
                    }
                  },
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_bag,
                          size: 20,
                          color: AppColor.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Add to Cart',
                          style: TextStyle(
                              color: AppColor.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
