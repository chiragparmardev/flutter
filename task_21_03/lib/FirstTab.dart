import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_21_03/AppColor.dart';
import 'package:task_21_03/Data/FirstTabData.dart';

class FirstTab extends StatefulWidget {
  const FirstTab({super.key});

  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount;

    crossAxisCount = screenWidth < 500
        ? 2
        : screenWidth < 700
            ? 3
            : screenWidth < 900
                ? 4
                : 5;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 20.w,
                  ),
                  shrinkWrap: true,
                  itemCount: item.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomCard(
                      icon: item[index].icon,
                      title: item[index].title,
                      centerFirstTitle: item[index].centerFirstTitle,
                      centerSecondTitle: item[index].centerSecondTitle,
                      bottomFirstText: item[index].bottomFirstText,
                      bottomSecondText: item[index].bottomSecondText,
                      color: item[index].color,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String centerFirstTitle;
  final String centerSecondTitle;
  final String bottomFirstText;
  final String bottomSecondText;
  const CustomCard({
    super.key,
    required this.icon,
    required this.title,
    required this.centerFirstTitle,
    required this.centerSecondTitle,
    required this.bottomFirstText,
    required this.bottomSecondText,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(25.r)),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 15.sp),
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(50.r)),
                child: Padding(
                  padding: EdgeInsets.all(15.0.r),
                  child: Center(
                    child: Icon(
                      icon,
                      color: AppColor.white,
                      size: 30.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      centerFirstTitle,
                      style: TextStyle(
                          color: AppColor.white,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      centerSecondTitle,
                      style: TextStyle(
                          color: AppColor.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 20.w, bottom: 20.h),
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    bottomFirstText,
                    style: TextStyle(
                        color: AppColor.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    bottomSecondText,
                    style: TextStyle(
                        color: AppColor.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
