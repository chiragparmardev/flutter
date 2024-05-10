// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_27_03/Cutom/Card/home_card.dart';
import 'package:task_27_03/Data/cart_data.dart';
import 'package:task_27_03/Data/home_data.dart';
import 'package:task_27_03/Data/rating_store.dart';
import 'package:task_27_03/Utils/AppColor.dart';
import 'package:task_27_03/route_setting.dart';

class StoreDetailsNested extends StatefulWidget {
  const StoreDetailsNested({
    super.key,
    // required this.storeindex,
  });

  // final int storeindex;

  @override
  State<StoreDetailsNested> createState() => _StoreDetailsNestedState();
}

class _StoreDetailsNestedState extends State<StoreDetailsNested> {
  var statusbar =
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColor.white,
    statusBarIconBrightness: Brightness.light,
  ));

  @override
  void initState() {
    statusbar;
    super.initState();
  }

  @override
  void dispose() {
    statusbar;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int totalItems = 0;

    for (var shopMap in cartItems) {
      List<Items> shopItems = List<Items>.from(shopMap['items']);
      totalItems += shopItems.length;
    }
    var storeindex = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                stretch: true,
                automaticallyImplyLeading: false,
                expandedHeight: 245,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColor.white,
                    )),
                title: Text(
                  'Store Details',
                  style: TextStyle(
                      color: AppColor.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                actions: [
                  Stack(children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, MyRouter.cart);
                        },
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: AppColor.white,
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
                            totalItems.toString(),
                            style: TextStyle(
                                color: AppColor.white,
                                fontSize: 7,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ],
                centerTitle: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
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
                                    image:
                                        AssetImage('assets/images/store.jpg'),
                                    fit: BoxFit.cover))),
                        Container(
                          height: 205,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColor.black.withOpacity(0.5)),
                        ),
                        Positioned(
                          top: 150,
                          left: 0,
                          right: 0,
                          child: HomeCardCustom(
                              ontap: () {
                                Navigator.pushNamed(
                                    context, MyRouter.store_product,
                                    arguments: storeindex);
                              },
                              imgUrl: homeCardData[storeindex].imgurl,
                              title: homeCardData[storeindex].title,
                              mile: homeCardData[storeindex].mile,
                              subtitle: homeCardData[storeindex].subtitle,
                              address: homeCardData[storeindex].address,
                              rank: homeCardData[storeindex].rank,
                              index: storeindex),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ];
          },
          body: SafeArea(
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Scaffold(
                body: Column(
                  children: [
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
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          child: Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                            // maxLines: 19,
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'All Reviews ${ratingStoreData.length}',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    'View All',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
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
                                                height: 67,
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
                                                              BorderRadius
                                                                  .circular(50),
                                                          color: Colors.red,
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  ratingStoreData[
                                                                          index]
                                                                      .profilePic),
                                                              fit: BoxFit
                                                                  .cover)),
                                                    ),
                                                    const SizedBox(
                                                      width: 14,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width -
                                                              102,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                ratingStoreData[
                                                                        index]
                                                                    .name,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Text(
                                                                ratingStoreData[
                                                                        index]
                                                                    .time,
                                                                style: const TextStyle(
                                                                    color: AppColor
                                                                        .grey500,
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          children:
                                                              List.generate(
                                                            5,
                                                            (i) {
                                                              Color iconColor;
                                                              int passedRating =
                                                                  ratingStoreData[
                                                                          index]
                                                                      .rating;

                                                              if (i <
                                                                  passedRating) {
                                                                iconColor =
                                                                    Colors
                                                                        .yellow;
                                                              } else {
                                                                iconColor =
                                                                    Colors
                                                                        .black;
                                                              }

                                                              return Icon(
                                                                Icons.star,
                                                                size: 11,
                                                                color:
                                                                    iconColor,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width -
                                                              102,
                                                          child: Text(
                                                            'Lorem Ipsum is simply dummy textLorem Ipsum is sim ply dummy textLorem Ipsum is simply dummy text',
                                                            style: TextStyle(
                                                              color: AppColor
                                                                  .grey500,
                                                              fontSize: 11,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                            overflow:
                                                                TextOverflow
                                                                    .visible,
                                                            maxLines: 2,
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
                                                color:
                                                    AppColor.greyLightShadow200,
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
            ),
          )),
    );
  }
}


// SingleChildScrollView(
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Padding(
                      //         padding: const EdgeInsets.only(
                      //             left: 15, right: 15, top: 20),
                      //         child: Row(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Text(
                      //               'All Reviews ${ratingStoreData.length}',
                      //               style: const TextStyle(
                      //                   fontSize: 14,
                      //                   fontWeight: FontWeight.bold),
                      //             ),
                      //             const Text(
                      //               'View All',
                      //               style: TextStyle(
                      //                   fontSize: 10,
                      //                   fontWeight: FontWeight.bold),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: const EdgeInsets.only(top: 20),
                      //         child: Column(
                      //           children: List.generate(
                      //               ratingStoreData.length,
                      //               (index) => Column(
                      //                     children: [
                      //                       Padding(
                      //                         padding: const EdgeInsets.only(
                      //                             left: 15, right: 15),
                      //                         child: SizedBox(
                      //                           height: 67,
                      //                           width: double.infinity,
                      //                           child: Row(
                      //                             crossAxisAlignment:
                      //                                 CrossAxisAlignment.center,
                      //                             mainAxisAlignment:
                      //                                 MainAxisAlignment.center,
                      //                             children: [
                      //                               Container(
                      //                                 height: 58,
                      //                                 width: 58,
                      //                                 decoration: BoxDecoration(
                      //                                     borderRadius:
                      //                                         BorderRadius
                      //                                             .circular(50),
                      //                                     color: Colors.red,
                      //                                     image: DecorationImage(
                      //                                         image: NetworkImage(
                      //                                             ratingStoreData[
                      //                                                     index]
                      //                                                 .profilePic),
                      //                                         fit: BoxFit
                      //                                             .cover)),
                      //                               ),
                      //                               const SizedBox(
                      //                                 width: 14,
                      //                               ),
                      //                               Column(
                      //                                 crossAxisAlignment:
                      //                                     CrossAxisAlignment
                      //                                         .start,
                      //                                 mainAxisAlignment:
                      //                                     MainAxisAlignment
                      //                                         .spaceBetween,
                      //                                 children: [
                      //                                   SizedBox(
                      //                                     width: MediaQuery.of(
                      //                                                 context)
                      //                                             .size
                      //                                             .width -
                      //                                         102,
                      //                                     child: Row(
                      //                                       mainAxisAlignment:
                      //                                           MainAxisAlignment
                      //                                               .spaceBetween,
                      //                                       children: [
                      //                                         Text(
                      //                                           ratingStoreData[
                      //                                                   index]
                      //                                               .name,
                      //                                           style: const TextStyle(
                      //                                               fontSize:
                      //                                                   14,
                      //                                               fontWeight:
                      //                                                   FontWeight
                      //                                                       .bold),
                      //                                         ),
                      //                                         Text(
                      //                                           ratingStoreData[
                      //                                                   index]
                      //                                               .time,
                      //                                           style: const TextStyle(
                      //                                               color: AppColor
                      //                                                   .grey500,
                      //                                               fontSize:
                      //                                                   10,
                      //                                               fontWeight:
                      //                                                   FontWeight
                      //                                                       .bold),
                      //                                         ),
                      //                                       ],
                      //                                     ),
                      //                                   ),
                      //                                   Row(
                      //                                     children:
                      //                                         List.generate(
                      //                                       5,
                      //                                       (i) {
                      //                                         Color iconColor;
                      //                                         int passedRating =
                      //                                             ratingStoreData[
                      //                                                     index]
                      //                                                 .rating;

                      //                                         if (i <
                      //                                             passedRating) {
                      //                                           iconColor =
                      //                                               Colors
                      //                                                   .yellow;
                      //                                         } else {
                      //                                           iconColor =
                      //                                               Colors
                      //                                                   .black;
                      //                                         }

                      //                                         return Icon(
                      //                                           Icons.star,
                      //                                           size: 11,
                      //                                           color:
                      //                                               iconColor,
                      //                                         );
                      //                                       },
                      //                                     ),
                      //                                   ),
                      //                                   SizedBox(
                      //                                     width: MediaQuery.of(
                      //                                                 context)
                      //                                             .size
                      //                                             .width -
                      //                                         102,
                      //                                     child: Text(
                      //                                       'Lorem Ipsum is simply dummy textLorem Ipsum is sim ply dummy textLorem Ipsum is simply dummy text',
                      //                                       style: TextStyle(
                      //                                         color: AppColor
                      //                                             .grey500,
                      //                                         fontSize: 11,
                      //                                         fontWeight:
                      //                                             FontWeight
                      //                                                 .w600,
                      //                                       ),
                      //                                       overflow:
                      //                                           TextOverflow
                      //                                               .visible,
                      //                                       maxLines: 2,
                      //                                     ),
                      //                                   ),
                      //                                 ],
                      //                               )
                      //                             ],
                      //                           ),
                      //                         ),
                      //                       ),
                      //                       Padding(
                      //                         padding: const EdgeInsets.only(
                      //                             top: 5, bottom: 5),
                      //                         child: const Divider(
                      //                           color:
                      //                               AppColor.greyLightShadow200,
                      //                         ),
                      //                       )
                      //                     ],
                      //                   )),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // )