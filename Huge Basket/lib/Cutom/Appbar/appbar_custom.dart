// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:task_27_03/Utils/AppColor.dart';

class uiHelper {
  static CustomAppbar(Function ontap, String title) {
    return PreferredSize(
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
          backgroundColor: AppColor.white,
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: Text(
            title,
            style: const TextStyle(
                color: AppColor.primary,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              onPressed: () {
                ontap();
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        ),
      ),
    );
  }

  static customAppbarWithBackCart(
      Function ontap, String title, Function? goCartOnTap, int totalCartItem) {
    return PreferredSize(
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
            scrolledUnderElevation: 0,
            backgroundColor: AppColor.white,
            leading: IconButton(
                onPressed: () {
                  ontap();
                },
                icon: const Icon(Icons.arrow_back_ios_new)),
            centerTitle: true,
            title: Text(
              // productData[0].category,
              title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primary),
            ),
            actions: [
              Stack(children: [
                IconButton(
                    onPressed: () {
                      goCartOnTap!();
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: AppColor.black,
                    )),
                Positioned(
                  right: 12,
                  top: 10,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColor.primary,
                    ),
                    child: Center(
                      child: Text(
                        totalCartItem.toString(),
                        style: const TextStyle(
                            color: AppColor.white,
                            fontSize: 7,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ));
  }

  static CustomAppbarWithCart(
    Function onTapCart,
    int totalCartItem,
  ) {
    return PreferredSize(
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
            scrolledUnderElevation: 0,
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
            leading: Stack(
              children: [
                Center(
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        size: 27,
                      )),
                ),
                Positioned(
                  top: 18,
                  left: 28,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColor.primary),
                    child: const Center(
                        child: Text(
                      '2',
                      style: TextStyle(
                          fontSize: 7,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white),
                    )),
                  ),
                )
              ],
            ),
            actions: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            onTapCart();
                          },
                          icon: const Icon(
                            Icons.shopping_cart_rounded,
                            size: 27,
                          )),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    left: 28,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColor.primary),
                      child: Center(
                          child: Text(
                        totalCartItem.toString(),
                        style: const TextStyle(
                            fontSize: 7,
                            fontWeight: FontWeight.bold,
                            color: AppColor.white),
                      )),
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
