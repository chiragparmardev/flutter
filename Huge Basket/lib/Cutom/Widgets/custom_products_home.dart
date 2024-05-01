import 'package:flutter/material.dart';
import 'package:task_27_03/Cutom/Widgets/custom_card_product.dart';
import 'package:task_27_03/Screen/product_more.dart';
import 'package:task_27_03/Utils/AppColor.dart';
import 'package:task_27_03/route_setting.dart';

class CustomProductsHome extends StatelessWidget {
  final String title;
  final List<dynamic> productsList;
  final String shopName;
  const CustomProductsHome({
    super.key,
    required this.title,
    required this.productsList,
    required this.shopName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(productsList.length, (index) {
        return Container(
          height: 245,
          width: double.infinity,
          decoration:
              BoxDecoration(color: AppColor.greenlightbackground, boxShadow: [
            BoxShadow(
                color: AppColor.black.withOpacity(0.1),
                blurRadius: 16,
                offset: const Offset(2, 2)),
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      productsList[index][0].category.toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, MyRouter.product_more,
                            arguments: ShopItems(
                                productList: productsList[index],
                                shopName: shopName));
                      },
                      child: const Row(
                        children: [
                          Text(
                            'More',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Row(
                      children: List.generate(
                          productsList[index].length > 5
                              ? 5
                              : productsList[index].length,
                          (i) => Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: CustomCardProduct(
                                  indexProduct: productsList[index],
                                  indexCardProduct: i,
                                  shopName: shopName,
                                ),
                              )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: const [
                              BoxShadow(
                                color: AppColor.greyShadow,
                                blurRadius: 16,
                              ),
                            ]),
                        clipBehavior: Clip.hardEdge,
                        child: Material(
                          color: Colors.transparent,
                          child: Ink(
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, MyRouter.product_more,
                                    arguments: productsList);
                              },
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_forward,
                                  size: 25,
                                  color: AppColor.primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
