import 'package:flutter/material.dart';
import 'package:task_27_03/Data/home_data.dart';
import 'package:task_27_03/Utils/AppColor.dart';
// import 'package:shimmer/shimmer.dart';

class CustomStoreProductAppbar extends StatelessWidget {
  const CustomStoreProductAppbar(
      {super.key,
      required this.storeindex,
      required this.ontapCart,
      required this.cartItems});

  final int storeindex;
  final Function ontapCart;
  final int cartItems;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 262,
        child: Stack(children: [
          Container(
              height: 262,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/store.jpg'),
                      fit: BoxFit.cover))),
          Container(
            height: 262,
            width: double.infinity,
            decoration: BoxDecoration(color: AppColor.black.withOpacity(0.5)),
            child: Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
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
                      Text(
                        homeCardData[storeindex].title,
                        style: const TextStyle(
                            color: AppColor.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            ontapCart();
                          },
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: AppColor.white,
                          ))
                    ],
                  ),
                  Container(
                      width: 73.8,
                      height: 73.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.blue,
                      ),
                      child:
                          // FutureBuilder(
                          //   future: Future.delayed(const Duration(seconds: 3)),
                          //   builder: (context, snapshot) {
                          //     if (snapshot.connectionState ==
                          //         ConnectionState.waiting) {
                          //       return Shimmer.fromColors(
                          //         baseColor: AppColor.grey200,
                          //         highlightColor: AppColor.grey500,
                          //         child: Container(
                          //           width: 73.8,
                          //           height: 73.8,
                          //           decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(50),
                          //             color: AppColor.white,
                          //           ),
                          //         ),
                          //       );
                          //     } else {
                          // return
                          ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          homeCardData[storeindex].imgurl,
                          fit: BoxFit.cover,
                        ),
                      )
                      //     }
                      //   },
                      // ),
                      ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    homeCardData[storeindex].address,
                    style: const TextStyle(
                      color: AppColor.white,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      showCursor: false,
                      decoration: InputDecoration(
                          fillColor: AppColor.white,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.only(left: 10, right: 10),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: AppColor.grey200,
                          ),
                          hintText:
                              'Search ${homeCardData[storeindex].title} ...',
                          hintStyle: const TextStyle(
                              color: AppColor.grey200,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50))),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 12,
            top: 45,
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColor.primary,
              ),
              child: Center(
                child: Text(
                  cartItems.toString(),
                  style: const TextStyle(
                      color: AppColor.white,
                      fontSize: 7,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ]));
  }
}
