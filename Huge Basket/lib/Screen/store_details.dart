// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_27_03/Cutom/Card/home_card.dart';
import 'package:task_27_03/Data/home_data.dart';
import 'package:task_27_03/Data/rating_store.dart';
import 'package:task_27_03/Utils/AppColor.dart';

class StoreDetails extends StatefulWidget {
  const StoreDetails({
    super.key,
    required this.storeindex,
  });
  final int storeindex;
  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  var statusbar =
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColor.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  void init() {
    statusbar;
    super.initState();
  }

  void dis() {
    statusbar;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 270,
              width: double.infinity,
              color: AppColor.white,
              child: Stack(
                children: [
                  Container(
                      height: 205,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/store.jpg'),
                              fit: BoxFit.cover))),
                  Container(
                    height: 205,
                    width: double.infinity,
                    decoration:
                        BoxDecoration(color: AppColor.black.withOpacity(0.5)),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: AppColor.white,
                                  )),
                              const Spacer(),
                              const Text(
                                'Store Details',
                                style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.shopping_cart,
                                    color: AppColor.white,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 0,
                    right: 0,
                    child: HomeCardCustom(
                        ontap: () {
                          Null;
                        },
                        imgUrl: homeCardData[widget.storeindex].imgurl,
                        title: homeCardData[widget.storeindex].title,
                        mile: homeCardData[widget.storeindex].mile,
                        subtitle: homeCardData[widget.storeindex].subtitle,
                        address: homeCardData[widget.storeindex].address,
                        rank: homeCardData[widget.storeindex].rank,
                        index: widget.storeindex),
                  )
                ],
              ),
            ),
            TabBar(
              labelPadding: EdgeInsets.only(
                right: 5,
                left: 5,
              ),
              indicator: BoxDecoration(color: Colors.transparent),
              labelColor: AppColor.primary,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              tabs: [
                Container(
                    color: AppColor.greenLight200,
                    child: Center(child: Tab(text: 'About Us'))),
                Container(
                  color: AppColor.greenLight200,
                  child: Center(child: Tab(text: 'Reviews')),
                ),
              ],
            ),
            Expanded(
                child: TabBarView(children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    // maxLines: 19,
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'All Reviews ${ratingStoreData.length}',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'View All',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: List.generate(
                            ratingStoreData.length,
                            (index) => Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: SizedBox(
                                        height: 63,
                                        width: double.infinity,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 58,
                                              width: 58,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: Colors.red,
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          ratingStoreData[index]
                                                              .profilePic),
                                                      fit: BoxFit.cover)),
                                            ),
                                            const SizedBox(
                                              width: 14,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      102,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        ratingStoreData[index]
                                                            .name,
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        ratingStoreData[index]
                                                            .time,
                                                        style: const TextStyle(
                                                            color: AppColor
                                                                .grey500,
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: List.generate(
                                                    5,
                                                    (i) {
                                                      Color iconColor;
                                                      int passedRating =
                                                          ratingStoreData[index]
                                                              .rating;

                                                      if (i < passedRating) {
                                                        iconColor =
                                                            Colors.yellow;
                                                      } else {
                                                        iconColor =
                                                            Colors.black;
                                                      }

                                                      return Icon(
                                                        Icons.star,
                                                        size: 11,
                                                        color: iconColor,
                                                      );
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      102,
                                                  child: Text(
                                                    'Lorem Ipsum is simply dummy textLorem Ipsum is sim ply dummy textLorem Ipsum is simply dummy text',
                                                    style: TextStyle(
                                                      color: AppColor.grey500,
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                    overflow:
                                                        TextOverflow.visible,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5),
                                      child: const Divider(
                                        color: AppColor.greyLightShadow200,
                                      ),
                                    )
                                  ],
                                )),
                      ),
                    )
                  ],
                ),
              )
            ]))
          ],
        ),
      ),
    );
  }
}
