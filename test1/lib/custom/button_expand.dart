import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonExpand extends StatelessWidget {
  final Color borderColor;
  final Color textColor;
  final String title;
  const ButtonExpand({
    super.key,
    required this.borderColor,
    required this.textColor,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      // height: 34.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: borderColor, width: 1)),
      child: Padding(
        padding: EdgeInsets.only(top: 7.h, bottom: 7.h),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: textColor,
                fontFamily: 'mont',
                fontSize: 15.sp,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    ));
  }
}
