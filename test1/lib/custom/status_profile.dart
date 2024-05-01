import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/Utils/AppColor.dart';

class StatusProfile extends StatelessWidget {
  final String number;
  final String title;
  const StatusProfile({
    super.key,
    required this.number,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
              color: AppColor.white,
              fontFamily: 'mont',
              fontSize: 24.sp,
              fontWeight: FontWeight.w600),
        ),
        Text(
          title,
          style: TextStyle(
              color: AppColor.fontgrey,
              fontFamily: 'mont',
              fontSize: 12.sp,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
