import 'package:flutter/material.dart';
import 'package:test_2/AppColor.dart';

class CustomPriceDisplay extends StatelessWidget {
  final String price;
  const CustomPriceDisplay({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColor.priceBg.withOpacity(0.10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Price',
                    style: TextStyle(
                        color: AppColor.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 6, bottom: 5),
                        child: Text(
                          '\$ $price',
                          style: const TextStyle(
                              color: AppColor.primary,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
