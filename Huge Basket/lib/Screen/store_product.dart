import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_27_03/Cutom/Widgets/custom_choose_category.dart';
import 'package:task_27_03/Cutom/Widgets/custom_products_home.dart';
import 'package:task_27_03/Cutom/Widgets/custom_store_product_appbar.dart';
import 'package:task_27_03/Data/cart_data.dart';
import 'package:task_27_03/Data/category_data.dart';
import 'package:task_27_03/Data/home_data.dart';
import 'package:task_27_03/Utils/AppColor.dart';
import 'package:task_27_03/route_setting.dart';

class StoreProduct extends StatefulWidget {
  const StoreProduct({super.key});

  @override
  State<StoreProduct> createState() => _StoreProductState();
}

class _StoreProductState extends State<StoreProduct> {
  late int selectedCategoryIndex;

  var statusbar =
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColor.white,
    statusBarIconBrightness: Brightness.light,
  ));
  @override
  void initState() {
    super.initState();
    statusbar;
    selectedCategoryIndex = 0;
  }

  @override
  void dispose() {
    super.dispose();
    statusbar;
  }

  @override
  Widget build(BuildContext context) {
    var storeindex = ModalRoute.of(context)!.settings.arguments as int;
    int totalItems = 0;

    for (var shopMap in cartItems) {
      List<Items> shopItems = List<Items>.from(shopMap['items']);
      totalItems += shopItems.length;
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        CustomStoreProductAppbar(
          storeindex: storeindex,
          ontapCart: () {
            Navigator.pushNamed(context, MyRouter.cart);
          },
          cartItems: totalItems,
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 156,
          width: double.infinity,
          decoration:
              BoxDecoration(color: AppColor.greenlightbackground, boxShadow: [
            BoxShadow(
                color: AppColor.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 2))
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 13, left: 13),
                child: Text(
                  'Choose your Category',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(
                          categoryData.length,
                          (index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedCategoryIndex = index;
                                  });
                                },
                                child: CustomChooseCategory(
                                  imgUrl: categoryData[index].imgUrl,
                                  title: categoryData[index].title,
                                  isSelected: index == selectedCategoryIndex,
                                ),
                              )))),
            ],
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        categoryData[selectedCategoryIndex].products == null ||
                categoryData[selectedCategoryIndex].products!.isEmpty
            ? const Center(
                child: Text(
                "No data Found",
              ))
            : CustomProductsHome(
                title: categoryData[selectedCategoryIndex]
                    .products![0][0]
                    .category,
                productsList: categoryData[selectedCategoryIndex].products!,
                shopName: homeCardData[storeindex].title,
              ),
        const SizedBox(height: 14),
      ]),
    ));
  }
}
