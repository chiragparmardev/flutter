import 'package:flutter/material.dart';
import 'package:task_27_03/Cutom/Appbar/appbar_custom.dart';
import 'package:task_27_03/Cutom/Card/home_card.dart';
import 'package:task_27_03/Data/cart_data.dart';
import 'package:task_27_03/Data/home_data.dart';
import 'package:task_27_03/Utils/AppColor.dart';
import 'package:task_27_03/route_setting.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    int totalItems = 0;

    for (var shopMap in cartItems) {
      List<Items> shopItems = List<Items>.from(shopMap['items']);
      totalItems += shopItems.length;
    }

    return Scaffold(
      appBar: uiHelper.CustomAppbarWithCart(() {
        Navigator.pushNamed(context, MyRouter.cart);
      }, totalItems),
      body: SingleChildScrollView(
        child: Column(
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
            Column(
              children: List.generate(
                  homeCardData.length,
                  (index) => HomeCardCustom(
                      ontap: () {
                        Navigator.pushNamed(context, MyRouter.store_details,
                            arguments: index);
                      },
                      index: index,
                      imgUrl: homeCardData[index].imgurl,
                      title: homeCardData[index].title,
                      mile: homeCardData[index].mile,
                      subtitle: homeCardData[index].subtitle,
                      address: homeCardData[index].address,
                      rank: homeCardData[index].rank)),
            ),
            const SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }
}
