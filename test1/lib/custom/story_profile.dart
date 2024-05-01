import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:test1/Utils/AppColor.dart';

class StoryProfile extends StatelessWidget {
  const StoryProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Column(
            children: [
              CircularPercentIndicator(
                radius: 27.0.r,
                lineWidth: 6.0,
                percent: 0.4,
                center: CircleAvatar(
                  radius: 24.0.r,
                  backgroundImage: const AssetImage('assets/images/boy.png'),
                ),
                backgroundColor: Colors.transparent,
                progressColor: AppColor.yellow,
              ),
              8.verticalSpace,
              const Text(
                'Dr. Philip',
                style: TextStyle(
                    color: AppColor.white,
                    fontFamily: 'mont',
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              4.verticalSpace,
              const Text(
                '3.0',
                style: TextStyle(
                    color: AppColor.white,
                    fontFamily: 'mont',
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              4.verticalSpace,
            ],
          ),
          15.horizontalSpace,
          Column(
            children: [
              CircularPercentIndicator(
                radius: 27.0.r,
                lineWidth: 6.0,
                percent: 0.3,
                center: CircleAvatar(
                  radius: 24.0.r,
                  backgroundImage: const AssetImage('assets/images/boy.png'),
                ),
                backgroundColor: Colors.transparent,
                progressColor: AppColor.yellow,
              ),
              8.verticalSpace,
              const Text(
                'Vanessa',
                style: TextStyle(
                    color: AppColor.white,
                    fontFamily: 'mont',
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              4.verticalSpace,
              const Text(
                '3.0',
                style: TextStyle(
                    color: AppColor.white,
                    fontFamily: 'mont',
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              4.verticalSpace,
            ],
          ),
          15.horizontalSpace,
          Column(
            children: [
              CircularPercentIndicator(
                radius: 27.0.r,
                lineWidth: 6.0,
                percent: 0.3,
                center: CircleAvatar(
                  radius: 24.0.r,
                  backgroundImage: const AssetImage('assets/images/boy.png'),
                ),
                backgroundColor: Colors.transparent,
                progressColor: AppColor.yellow,
              ),
              8.verticalSpace,
              const Text(
                'Vanessa',
                style: TextStyle(
                    color: AppColor.white,
                    fontFamily: 'mont',
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              4.verticalSpace,
              const Text(
                '3.0',
                style: TextStyle(
                    color: AppColor.white,
                    fontFamily: 'mont',
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              4.verticalSpace,
            ],
          ),
          15.horizontalSpace,
          Column(
            children: [
              CircularPercentIndicator(
                radius: 27.0.r,
                lineWidth: 6.0,
                percent: 1,
                center: Stack(children: [
                  CircleAvatar(
                    radius: 24.0.r,
                    backgroundImage: const AssetImage('assets/images/boy.png'),
                  ),
                  Container(
                    height: 48.r,
                    width: 48.r,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: const Color.fromARGB(137, 0, 0, 0)),
                    child: const Center(
                      child: Text(
                        '+12',
                        style: TextStyle(
                            color: AppColor.white,
                            fontFamily: 'mont',
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ]),
                backgroundColor: Colors.transparent,
                progressColor: AppColor.yellow,
              ),
              8.verticalSpace,
              const Text(
                'Vanessa',
                style: TextStyle(
                    color: AppColor.white,
                    fontFamily: 'mont',
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              4.verticalSpace,
              const Text(
                '3.0',
                style: TextStyle(
                    color: AppColor.white,
                    fontFamily: 'mont',
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              4.verticalSpace,
            ],
          ),
          15.horizontalSpace,
          Column(
            children: [
              Container(
                height: 48.h,
                width: 2,
                color: AppColor.white,
              ),
              Container(
                height: 48.h,
                width: 1,
                color: Colors.transparent,
              ),
            ],
          ),
          15.horizontalSpace,
          Column(
            children: [
              DottedBorder(
                color: AppColor.yellow,
                strokeWidth: 5,
                dashPattern: const [6, 5],
                borderType: BorderType.RRect,
                radius: Radius.circular(50.r),
                padding: const EdgeInsets.all(0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50.r)),
                  child: Container(
                    height: 48,
                    width: 48,
                    color: AppColor.black,
                    child: const Center(
                        child: Icon(
                      Icons.add,
                      color: AppColor.yellow,
                    )),
                  ),
                ),
              ),
              8.verticalSpace,
              const Text(
                'Join',
                style: TextStyle(
                    color: AppColor.white,
                    fontFamily: 'mont',
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              20.verticalSpace,
            ],
          ),
          15.horizontalSpace,
        ],
      ),
    );
  }
}
