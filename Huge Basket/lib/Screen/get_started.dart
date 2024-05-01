// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:task_27_03/Utils/AppColor.dart';
import 'package:task_27_03/route_setting.dart';

class Data {
  final String image;
  final String title;

  Data({required this.image, required this.title});
}

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  int CurrentIndex = 0;
  late PageController controller;
  var statusbar =
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColor.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  @override
  void initState() {
    statusbar;
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    statusbar;
    controller.dispose();
    super.dispose();
  }

  List<Data> datas = [
    Data(
        image: 'assets/json/location1.json',
        title: "Near by store and Product"),
    Data(image: 'assets/json/payment1.json', title: "Secure Payment Method"),
    Data(image: 'assets/json/chat1.json', title: "Chat with Supplier"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: AppColor.white,
        body: Stack(children: [
          PageView.builder(
              itemCount: datas.length,
              controller: controller,
              onPageChanged: (int index) {
                setState(() {
                  CurrentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 300,
                          child: Lottie.asset(datas[i].image,
                              fit: BoxFit.contain)),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        datas[i].title,
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.textgGreyblack),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                );
              }),
          Positioned(
            top: 20,
            right: 20,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      if (CurrentIndex != datas.length - 1) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, MyRouter.mobile_login, (route) => false);
                      }
                    },
                    child: Text(
                      CurrentIndex == datas.length - 1 ? '' : 'Skip',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.black),
                    ),
                  )),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                      children: List.generate(
                          datas.length, (index) => CustomDot(index))),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(20)),
                    clipBehavior: Clip.hardEdge,
                    child: Material(
                      color: Colors.transparent,
                      child: Ink(
                        child: InkWell(
                          onTap: () {
                            if (CurrentIndex == datas.length - 1) {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  MyRouter.mobile_login, (route) => false);
                            } else {
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 7, bottom: 7),
                            child: Center(
                                child: Text(
                              CurrentIndex == datas.length - 1 ? 'Go' : 'Next',
                              style: const TextStyle(
                                  color: AppColor.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  Row CustomDot(int index) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            controller.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut);
          },
          child: Container(
            height: 10,
            width: CurrentIndex == index ? 30 : 10,
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: CurrentIndex == index
                    ? AppColor.primary
                    : AppColor.black.withOpacity(0.30)),
          ),
        ),
      ],
    );
  }
}
