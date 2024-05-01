import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:task_27_03/Screen/product_details.dart';
import 'package:task_27_03/Utils/AppColor.dart';
import 'package:task_27_03/route_setting.dart';

class CustomCardProduct extends StatefulWidget {
  final List<dynamic> indexProduct;
  final int indexCardProduct;
  final String shopName;

  const CustomCardProduct(
      {super.key,
      required this.indexProduct,
      required this.indexCardProduct,
      required this.shopName});

  @override
  State<CustomCardProduct> createState() => _CustomCardProductState();
}

class _CustomCardProductState extends State<CustomCardProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 178,
      width: 147,
      decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: AppColor.greyShadow,
              blurRadius: 16,
            ),
          ]),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            MyRouter.product_details,
            arguments: ProductDetailsArguments(
              shopName: widget.shopName,
              index: widget.indexCardProduct,
              productList: widget.indexProduct,
            ),
          );
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 11, right: 11),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: SizedBox(
                            height: 88,
                            width: 88,
                            child: Image.asset(
                              widget
                                  .indexProduct[widget.indexCardProduct].imgUrl,
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ ${widget.indexProduct[widget.indexCardProduct].count.value == 0 ? int.parse(widget.indexProduct[widget.indexCardProduct].price) : widget.indexProduct[widget.indexCardProduct].count.value * int.parse(widget.indexProduct[widget.indexCardProduct].price)}',
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        widget.indexProduct[widget.indexCardProduct].mg,
                        style: const TextStyle(
                            color: AppColor.grey500,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      widget.indexProduct[widget.indexCardProduct].subtitle,
                      style: const TextStyle(
                        color: AppColor.grey500,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
            widget.indexProduct[widget.indexCardProduct].count.value == 0
                ? Positioned(
                    right: 10,
                    top: 10,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          widget.indexProduct[widget.indexCardProduct].count
                              .value = 1;
                        });
                      },
                      child: DottedBorder(
                        dashPattern: const [5, 5],
                        padding: const EdgeInsets.all(0),
                        color: AppColor.primary,
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(50),
                        child: Container(
                          height: 26,
                          width: 26,
                          decoration: BoxDecoration(
                              color: AppColor.greenBg,
                              borderRadius: BorderRadius.circular(50)),
                          child: const Icon(
                            Icons.add,
                            color: AppColor.primary,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                : Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      height: 90,
                      width: 34,
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(color: AppColor.primary, width: 1)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  widget.indexProduct[widget.indexCardProduct]
                                      .count.value++;
                                });
                              },
                              child: const Icon(
                                Icons.add,
                                size: 22,
                              ),
                            ),
                            Text(
                              widget.indexProduct[widget.indexCardProduct].count
                                  .value
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            widget.indexProduct[widget.indexCardProduct].count
                                        .value ==
                                    1
                                ? InkWell(
                                    onTap: () {
                                      setState(() {
                                        widget
                                            .indexProduct[
                                                widget.indexCardProduct]
                                            .count
                                            .value = 0;
                                      });
                                    },
                                    child: const Icon(
                                      Icons.delete_outline_outlined,
                                      size: 22,
                                      color: Colors.red,
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      setState(() {
                                        widget
                                            .indexProduct[
                                                widget.indexCardProduct]
                                            .count
                                            .value--;
                                      });
                                    },
                                    child: const Icon(
                                      Icons.remove,
                                      size: 22,
                                    ),
                                  )
                          ],
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
