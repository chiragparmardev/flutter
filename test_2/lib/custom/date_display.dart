import 'package:flutter/material.dart';
import 'package:test_2/AppColor.dart';

class CustomDateDisplay extends StatelessWidget {
  final String title;
  final String date;
  final String month;
  final String year;
  const CustomDateDisplay({
    super.key,
    required this.title,
    required this.date,
    required this.month,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColor.white,
          border: Border.all(color: AppColor.textGrey, width: 1)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: AppColor.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                      color: AppColor.black,
                      fontSize: 28,
                      fontWeight: FontWeight.w700),
                ),
                Column(
                  children: [
                    Text(
                      month,
                      style: const TextStyle(
                          color: AppColor.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      year,
                      style: const TextStyle(
                          color: AppColor.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
