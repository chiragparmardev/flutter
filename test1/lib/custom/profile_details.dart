import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test1/Utils/AppColor.dart';
import 'package:test1/custom/button_expand.dart';
import 'package:test1/custom/status_profile.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 62.5.r,
                backgroundImage: const AssetImage('assets/images/boy.png'),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Perry Schaden',
                                style: TextStyle(
                                    color: AppColor.white,
                                    fontFamily: 'mont',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              SvgPicture.asset('assets/svgs/badge.svg'),
                            ],
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/svgs/share.svg'),
                              SizedBox(
                                width: 5.w,
                              ),
                              SvgPicture.asset('assets/svgs/heart.svg'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    Text(
                      'Director of Sport & Head Coach',
                      style: TextStyle(
                          color: AppColor.fontgrey,
                          fontFamily: 'mont',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svgs/save.svg'),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          '4.5',
                          style: TextStyle(
                              color: AppColor.fontgrey,
                              fontFamily: 'mont',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        SvgPicture.asset('assets/svgs/star.svg'),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          '3.7',
                          style: TextStyle(
                              color: AppColor.white,
                              fontFamily: 'mont',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          '(12)',
                          style: TextStyle(
                              color: AppColor.fontgrey,
                              fontFamily: 'mont',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svgs/km.svg'),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          '5 kms away',
                          style: TextStyle(
                              color: AppColor.fontgrey,
                              fontFamily: 'mont',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svgs/racket.svg'),
                        SizedBox(
                          width: 16.w,
                        ),
                        SvgPicture.asset('assets/svgs/tableball.svg'),
                        SizedBox(
                          width: 16.w,
                        ),
                        SvgPicture.asset('assets/svgs/bat.svg'),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StatusProfile(number: "1234", title: "Followers"),
              StatusProfile(number: "1234", title: "Students"),
              StatusProfile(number: "1234", title: "AED/hr")
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              const ButtonExpand(
                  borderColor: AppColor.yellow,
                  textColor: AppColor.yellow,
                  title: 'Follow'),
              SizedBox(
                width: 16.w,
              ),
              const ButtonExpand(
                  borderColor: AppColor.fontgrey,
                  textColor: AppColor.fontgrey,
                  title: 'Message'),
            ],
          ),
        ],
      ),
    );
  }
}
