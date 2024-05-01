import 'package:flutter/material.dart';
import 'package:task_27_03/Utils/AppColor.dart';

class HomeCardCustom extends StatefulWidget {
  const HomeCardCustom({
    required this.imgUrl,
    required this.title,
    required this.mile,
    required this.subtitle,
    required this.address,
    required this.rank,
    required this.index,
    this.ontap,
    super.key,
  });
  final int index;
  final String imgUrl;
  final String title;
  final String mile;
  final String subtitle;
  final String address;
  final String rank;
  final Function? ontap;

  @override
  State<HomeCardCustom> createState() => _HomeCardCustomState();
}

class _HomeCardCustomState extends State<HomeCardCustom> {
  late Future<void> loading;
  bool isloading = true;

  @override
  void initState() {
    super.initState();
    loading = Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isloading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 7),
      child: Container(
        height: 95,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: AppColor.greyLightShadow200,
              blurRadius: 10,
              spreadRadius: 10,
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            widget.ontap!();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(children: [
              SizedBox(
                height: 95,
                width: 69,
                child: Stack(children: [
                  Align(
                    alignment: Alignment.center,
                    child: isloading
                        ? const CircularProgressIndicator()
                        : Container(
                            height: 69,
                            width: 69,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.blue,
                                image: DecorationImage(
                                    image: NetworkImage(widget.imgUrl),
                                    fit: BoxFit.cover)),
                          ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 22,
                    child: Container(
                      width: 30,
                      height: 16,
                      decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              size: 8,
                              color: AppColor.white,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              widget.rank,
                              style: const TextStyle(
                                  color: AppColor.white, fontSize: 8),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, right: 15, left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppColor.black),
                          ),
                          Text(
                            widget.mile,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: AppColor.grey200),
                          )
                        ],
                      ),
                      Text(
                        widget.subtitle,
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: AppColor.grey200),
                      ),
                      Text(
                        widget.address,
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: AppColor.grey200),
                      )
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
