import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test1/Utils/AppColor.dart';
import 'package:test1/custom/custom_radio.dart';

class LocationCard extends StatelessWidget {
  final int index;
  final bool isSelected;
  final Function(int) onSelect;
  const LocationCard({
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
      padding: EdgeInsets.only(right: 8.w),
      child: Container(
        height: 94.h,
        width: 361.w,
        decoration: BoxDecoration(
            color: AppColor.mirrorBlack,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColor.white, width: 0.5.w)),
        child: Padding(
          padding: EdgeInsets.all(12.0.w),
          child: Row(
            children: [
              Container(
                width: 70.h,
                height: 70.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    color: AppColor.blackLight,
                    image: const DecorationImage(
                        image: AssetImage('assets/images/ground.png'),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 8.w,
              ),
              SizedBox(
                height: 74.h,
                width: 190.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rocks Lane - Chiswick',
                      style: TextStyle(
                          fontFamily: 'mont',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.whiteMedium),
                    ),
                    Text(
                      '(2kms away from you)',
                      style: TextStyle(
                          fontFamily: 'mont',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.fontgrey),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/Dirham.svg',
                          width: 14.09.w,
                          height: 16.92.h,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          'AED 2345',
                          style: TextStyle(
                              fontFamily: 'mont',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColor.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  CustomRadio(
                      onSelect: onSelect, index: index, svgicon: svgicon),
                  const Spacer(),
                  Container(
                    height: 32.h,
                    width: 32.h,
                    decoration: BoxDecoration(
                        color: AppColor.yellow,
                        borderRadius: BorderRadius.circular(8.r)),
                    child: Center(
                      child:
                          SvgPicture.asset('assets/svgs/forward_triangle.svg'),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
