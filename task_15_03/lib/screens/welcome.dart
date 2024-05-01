import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_15_03/AppColor.dart';
import 'package:task_15_03/screens/signin.dart';
import 'package:task_15_03/screens/signup.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(18.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 56.h,
              ),
              Text(
                'Hlis',
                style: TextStyle(
                  fontFamily: 'tt',
                  fontSize: 50.sp,
                  color: AppColor.primary,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Text(
                'Welcome!',
                style: TextStyle(
                  fontFamily: 'sf',
                  fontSize: 22.sp,
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 69.w),
                child: Text(
                  "Then you should sign in. We promise you won't regret this!",
                  style: TextStyle(
                    fontFamily: 'sfx',
                    fontSize: 16.sp,
                    color: AppColor.textlightcolor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      top: 47.h,
                      left: 12.w,
                      child: CircleAvatar(
                        radius: 45.r,
                        backgroundImage:
                            const AssetImage('assets/images/car.png'),
                      ),
                    ),
                    Positioned(
                      right: 15.w,
                      top: 26.h,
                      child: CircleAvatar(
                        radius: 45.r,
                        backgroundImage:
                            const AssetImage('assets/images/room.png'),
                      ),
                    ),
                    Positioned(
                      left: 37.w,
                      bottom: 77.h,
                      child: CircleAvatar(
                        radius: 35.r,
                        backgroundImage:
                            const AssetImage('assets/images/boy.png'),
                      ),
                    ),
                    Positioned(
                      right: 36.w,
                      bottom: 142.h,
                      child: CircleAvatar(
                        radius: 26.5.r,
                        backgroundImage:
                            const AssetImage('assets/images/building.png'),
                      ),
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: 65.5.r,
                        backgroundImage:
                            const AssetImage('assets/images/girl.png'),
                      ),
                    ),
                  ],
                ),
              ),
              FullButton(
                  title: 'Create Account',
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp()));
                  },
                  bgColor: AppColor.primary,
                  textColor: AppColor.white),
              SizedBox(
                height: 27.33.h,
              ),
              FullButton(
                  title: 'Sign In',
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignIn()));
                  },
                  bgColor: AppColor.buttonGrey,
                  textColor: AppColor.white)
            ],
          ),
        ),
      ),
    );
  }
}

class FullButton extends StatelessWidget {
  final String title;
  final Function ontap;
  final Color bgColor;
  final Color textColor;
  const FullButton({
    super.key,
    required this.title,
    required this.ontap,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(5.r)),
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            onTap: () {
              ontap();
            },
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                    fontFamily: 'sf',
                    fontSize: 20.sp,
                    color: textColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
