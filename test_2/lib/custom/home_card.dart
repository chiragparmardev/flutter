import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_2/AppColor.dart';
import 'package:test_2/custom/date_display.dart';
import 'package:test_2/custom/price_display.dart';

class CustomHomeCard extends StatelessWidget {
  final dynamic coursesData;
  const CustomHomeCard({
    super.key,
    required this.coursesData,
  });

  @override
  Widget build(BuildContext context) {
    List<String> startDateComponents = coursesData['startDate'].split(' ');
    List<String> endDateComponents = coursesData['endDate'].split(' ');

    String startDay = startDateComponents[0];
    String startMonth = startDateComponents[1];
    String startYear = startDateComponents[2];

    String endDay = endDateComponents[0];
    String endMonth = endDateComponents[1];
    String endYear = endDateComponents[2];

    startMonth = startMonth.replaceAll(',', '');
    endMonth = endMonth.replaceAll(',', '');

    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColor.white, borderRadius: BorderRadius.circular(6)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 76,
                  width: 76,
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: FileImage(File(coursesData['courseImage'])),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 13,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        coursesData['courseName'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: AppColor.black),
                      ),
                      Text(
                        coursesData['description'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColor.textGrey),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                CustomDateDisplay(
                  title: 'Start',
                  date: startDay,
                  month: startMonth,
                  year: startYear,
                ),
                const SizedBox(
                  width: 15,
                ),
                CustomDateDisplay(
                  title: 'End',
                  date: endDay,
                  month: endMonth,
                  year: endYear,
                ),
                const SizedBox(
                  width: 15,
                ),
                CustomPriceDisplay(
                  price: coursesData['price'],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
