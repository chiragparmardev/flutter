import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test1/Utils/AppColor.dart';

class SessionList extends StatelessWidget {
  final String title;
  final String icon;
  const SessionList({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: 24.h,
            width: 24.h,
            child: Center(
                child: SvgPicture.asset(
              icon,
              width: 17.99.w,
              height: 17.99.h,
            ))),
        SizedBox(
          width: 16.w,
        ),
        Text(
          title,
          style: const TextStyle(
              color: AppColor.fontgrey,
              fontFamily: 'mont',
              fontSize: 14,
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
