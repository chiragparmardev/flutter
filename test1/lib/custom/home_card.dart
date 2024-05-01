import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:test1/Utils/AppColor.dart';
import 'package:test1/screen/profile.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: SizedBox(
        // height: 144.h,
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Container(
                // height: 134.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: const GradientBoxBorder(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [AppColor.white, AppColor.whiteLight])),
                    borderRadius: BorderRadius.circular(18.w),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColor.black, AppColor.blackLight])),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20.w, top: 25.5.h, right: 20.w, bottom: 20.w),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 4,
                          fit: FlexFit.tight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 36.h,
                                    width: 36.h,
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/images/Reliance.png'),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50.w))),
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Reliance',
                                            style: TextStyle(
                                                fontFamily: 'mont',
                                                fontSize: 16.sp,
                                                color: AppColor.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                border: GradientBoxBorder(
                                                    width: 0.5.w,
                                                    gradient:
                                                        const LinearGradient(
                                                            begin: Alignment
                                                                .centerLeft,
                                                            end: Alignment
                                                                .centerRight,
                                                            colors: [
                                                          AppColor.white,
                                                          AppColor.whiteLight
                                                        ])),
                                                borderRadius:
                                                    BorderRadius.circular(50.w),
                                                gradient: const LinearGradient(
                                                    begin: Alignment.topRight,
                                                    end: Alignment.bottomLeft,
                                                    colors: [
                                                      AppColor.black,
                                                      AppColor.blackLight
                                                    ])),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 6.w,
                                                  right: 6.w,
                                                  top: 0.5.h,
                                                  bottom: 0.5.h),
                                              child: Center(
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                        height: 10.w,
                                                        width: 10.w,
                                                        child: Image.asset(
                                                          'assets/images/reliance_logo.png',
                                                          fit: BoxFit.cover,
                                                        )),
                                                    SizedBox(
                                                      width: 3.w,
                                                    ),
                                                    Text(
                                                      "NSE",
                                                      style: TextStyle(
                                                          fontFamily: 'mont',
                                                          fontSize: 10.sp,
                                                          color: AppColor.white,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Text(
                                        'Reliance Industries Ltd',
                                        style: TextStyle(
                                            fontFamily: 'mont',
                                            fontSize: 12.sp,
                                            color: AppColor.fontLightGrey,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 18.h,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Gain so far',
                                        style: TextStyle(
                                            fontFamily: 'mont',
                                            fontSize: 12.sp,
                                            color: AppColor.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      GradientText(
                                        '0.00%',
                                        style: TextStyle(
                                            fontFamily: 'mont',
                                            fontSize: 14.sp,
                                            color: AppColor.white,
                                            fontWeight: FontWeight.w500),
                                        colors: const [
                                          AppColor.blue,
                                          AppColor.blueLight
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 26.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Potential left',
                                        style: TextStyle(
                                            fontFamily: 'mont',
                                            fontSize: 12.sp,
                                            color: AppColor.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      GradientText(
                                        '34.7%',
                                        style: TextStyle(
                                            fontFamily: 'mont',
                                            fontSize: 14.sp,
                                            color: AppColor.white,
                                            fontWeight: FontWeight.w500),
                                        colors: const [
                                          AppColor.blue,
                                          AppColor.blueLight
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          )),
                      Flexible(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'LTP',
                                style: TextStyle(
                                    fontFamily: 'mont',
                                    fontSize: 12.sp,
                                    color: AppColor.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const RotatedBox(
                                    quarterTurns: 3,
                                    child: Icon(
                                      Icons.play_arrow,
                                      size: 18,
                                      color: AppColor.greenDark,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    '2764.64',
                                    style: TextStyle(
                                        fontFamily: 'mont',
                                        fontSize: 18.sp,
                                        color: AppColor.greenDark,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 18.h,
                              ),
                              Container(
                                // height: 32.h,
                                // width: 95.w,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.w)),
                                  gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        AppColor.greenDark,
                                        AppColor.greenLight
                                      ]),
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 6.h,
                                      bottom: 6.h,
                                      left: 15.w,
                                      right: 15.w),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Ink(
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ProfilePage()));
                                        },
                                        child: Center(
                                          child: Text(
                                            'Short Term',
                                            style: TextStyle(
                                                color: AppColor.black,
                                                fontFamily: 'mont',
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.h,
            left: 16.w,
            child: Container(
              height: 20.h,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColor.pink, AppColor.pinkLight]),
                  borderRadius: BorderRadius.circular(50.w)),
              child: Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: const Text(
                  'Intraday',
                  style: TextStyle(
                      color: AppColor.white,
                      fontFamily: 'mont',
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Positioned(
            right: 85.5.w,
            // right: MediaQuery.of(context).size.width * 0.254,
            // right: 110.5,
            top: -3.h,
            child: const RotatedBox(
              quarterTurns: 3,
              child: Icon(
                Icons.play_arrow,
                color: AppColor.greenDark,
              ),
            ),
          ),
          Positioned(
            right: 18.w,
            top: 0.h,
            //  right: MediaQuery.of(context).size.width * 0.043,
            child: Container(
              // height: 20.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6.w)),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColor.greenDark, AppColor.greenLight]),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 10.w, right: 10.w, top: 4.h, bottom: 4.h),
                child: Center(
                  child: Text(
                    'Short Term',
                    style: TextStyle(
                        color: AppColor.black,
                        fontFamily: 'mont',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
