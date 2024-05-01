import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task_27_03/Data/cart_data.dart';
import 'package:task_27_03/Utils/AppColor.dart';
import 'package:task_27_03/route_setting.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    int totalItems = 0;
    double total = 0;

    for (var shopMap in cartItems) {
      List<Items> shopItems = List<Items>.from(shopMap['items']);
      totalItems += shopItems.length;
      for (var item in shopItems) {
        total += item.quantity * item.price;
      }
    }
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColor.grey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 6,
                blurRadius: 6,
                offset: const Offset(0, -6),
              ),
            ],
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: AppColor.white,
            title: const Text(
              'Huge Basket',
              style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new)),
          ),
        ),
      ),
      body: totalItems == 0
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LottieBuilder.asset(
                  'assets/json/cart_empty.json',
                  height: 300,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, MyRouter.home_page);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Your cart is empty',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColor.white),
                      ),
                    ),
                  ),
                )
              ],
            ))
          : Column(
              children: [
                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: AppColor.greenLight200,
                      boxShadow: [
                        BoxShadow(
                            color: AppColor.greenLightShadow200,
                            spreadRadius: 6,
                            blurRadius: 10)
                      ]),
                  child: const Center(
                    child: Text(
                      'Next delivery on Wed, 14 Nov 2020',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primary),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: AppColor.greenLight200,
                      border: Border.symmetric(
                        horizontal: BorderSide(
                            color: Color.fromARGB(255, 220, 220, 220),
                            width: 1),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Sub Total ($totalItems items) : \$ $total",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> shopMap = cartItems[index];
                        String shopName = shopMap['shopName'];
                        List<Items> shopItems =
                            List<Items>.from(shopMap['items']);
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: AppColor.white,
                                border: Border.symmetric(
                                  horizontal: BorderSide(
                                      color: Color.fromARGB(255, 220, 220, 220),
                                      width: 1),
                                )),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    shopName,
                                    style: const TextStyle(
                                        color: AppColor.grey500,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: shopItems.length,
                                      itemBuilder: (context, index) {
                                        Items item = shopItems[index];
                                        return Column(
                                          children: [
                                            SizedBox(
                                              height: 84,
                                              width: double.infinity,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 80,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            item.imgUrl),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              item.name,
                                                              style: const TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: AppColor
                                                                      .grey500),
                                                            ),
                                                            const Spacer(),
                                                            InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  setState(() {
                                                                    for (var shopMap
                                                                        in cartItems) {
                                                                      List<Items>
                                                                          shopItems =
                                                                          List<Items>.from(
                                                                              shopMap['items']);
                                                                      for (int i =
                                                                              0;
                                                                          i < shopItems.length;
                                                                          i++) {
                                                                        if (shopItems[i] ==
                                                                            item) {
                                                                          shopItems
                                                                              .removeAt(i);
                                                                          total -=
                                                                              item.price * item.quantity;
                                                                          break;
                                                                        }
                                                                      }
                                                                      if (shopItems
                                                                          .isEmpty) {
                                                                        cartItems
                                                                            .remove(shopMap);
                                                                        break;
                                                                      } else {
                                                                        shopMap['items'] =
                                                                            shopItems;
                                                                      }
                                                                    }
                                                                  });
                                                                });
                                                              },
                                                              child: const Icon(
                                                                Icons
                                                                    .delete_outline_outlined,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Text(
                                                          '\$ ${item.price}',
                                                          style: const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: AppColor
                                                                  .black),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              item.mg,
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: AppColor
                                                                      .textgGreyblack),
                                                            ),
                                                            SizedBox(
                                                              width: 116,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    height: 20,
                                                                    width: 20,
                                                                    decoration: BoxDecoration(
                                                                        color: AppColor
                                                                            .primary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(50)),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          if (item.quantity >
                                                                              1) {
                                                                            item.quantity--;
                                                                          }
                                                                        });
                                                                      },
                                                                      child:
                                                                          const Center(
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .remove,
                                                                          size:
                                                                              15,
                                                                          color:
                                                                              AppColor.white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    item.quantity
                                                                        .toString(),
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: AppColor
                                                                            .black),
                                                                  ),
                                                                  Container(
                                                                    height: 20,
                                                                    width: 20,
                                                                    decoration: BoxDecoration(
                                                                        color: AppColor
                                                                            .primary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(50)),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          item.quantity++;
                                                                        });
                                                                      },
                                                                      child:
                                                                          const Center(
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .add,
                                                                          size:
                                                                              15,
                                                                          color:
                                                                              AppColor.white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            if (index != shopItems.length - 1)
                                              const Divider(
                                                color:
                                                    AppColor.greyLightShadow200,
                                              ),
                                          ],
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
      bottomNavigationBar: totalItems == 0
          ? const SizedBox()
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    AppColor.white.withOpacity(0.2),
                    AppColor.white,
                  ])),
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 20, left: 40, right: 40, top: 20),
                child: Container(
                  height: 52,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: total < 10 ? AppColor.grey200 : AppColor.primary,
                      borderRadius: BorderRadius.circular(50)),
                  clipBehavior: Clip.hardEdge,
                  child: Material(
                    color: Colors.transparent,
                    child: Ink(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (total > 10) {
                              // cartItems.clear();
                              // totalItems = 0;
                              // total = 0;
                              Navigator.pushNamed(
                                  context, MyRouter.place_your_order,
                                  arguments: total);
                              // Navigator.pushNamedAndRemoveUntil(context,
                              //     MyRouter.order_confirm, (route) => false);
                            }
                          });
                        },
                        child: Center(
                          child: Text(
                            total < 10
                                ? '\$10 Min. to Checkout'
                                : 'Proceed to Checkout',
                            style: const TextStyle(
                                color: AppColor.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
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
