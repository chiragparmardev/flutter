import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test1/Utils/AppColor.dart';
import 'package:test1/custom/custom_radio.dart';

class PackageCard extends StatelessWidget {
  final int index;
  final bool isSelected;
  final Function(int) onSelect;
  const PackageCard({
    super.key,
    required this.index,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    String svgicon = isSelected
        ? 'assets/svgs/Checkboxes.svg'
        : 'assets/svgs/border_round.svg';
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: Container(
        // height: 108.h,
        width: 210.w,
        decoration: BoxDecoration(
            color: AppColor.mirrorBlack,
            border: Border.all(color: AppColor.white, width: 0.5),
            borderRadius: BorderRadius.circular(12.r)),
        child: Padding(
          padding: EdgeInsets.all(14.5.w),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/svgs/calendar.svg'),
                  8.horizontalSpace,
                  Text(
                    '5 sessions ',
                    style: TextStyle(
                        color: AppColor.white,
                        fontFamily: 'mont',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  Spacer(),
                  CustomRadio(
                      onSelect: onSelect, index: index, svgicon: svgicon),
                ],
              ),
              4.verticalSpace,
              Row(children: [
                SvgPicture.asset('assets/svgs/time.svg'),
                8.horizontalSpace,
                Text(
                  '60 min per session',
                  style: TextStyle(
                      color: AppColor.white,
                      fontFamily: 'mont',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              ]),
              4.verticalSpace,
              const Divider(),
              Row(children: [
                SvgPicture.asset('assets/svgs/Dirham.svg'),
                8.horizontalSpace,
                Text(
                  'AED 2345 ',
                  style: TextStyle(
                      color: AppColor.white,
                      fontFamily: 'mont',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
