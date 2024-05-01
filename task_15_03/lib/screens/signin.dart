import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_15_03/AppColor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_15_03/screens/signup.dart';
import 'package:task_15_03/screens/welcome.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isPasswordVisible = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isNumeric(String? str) {
    if (str == null) {
      return false;
    }
    return int.tryParse(str) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: 392.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
                child: Stack(children: [
                  Container(
                    height: 392.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                    child: const Image(
                      image: AssetImage('assets/images/public.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 392.h,
                    width: double.infinity,
                    child: const Image(
                      image: AssetImage('assets/images/black.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                      top: 35.h,
                      left: 16.w,
                      child: Container(
                        height: 31.h,
                        width: 31.w,
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(8.r)),
                        clipBehavior: Clip.hardEdge,
                        child: Material(
                          color: Colors.transparent,
                          child: Ink(
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/svgs/back.svg',
                                  height: 11.84.h,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                    top: 142.h,
                    left: 14.w,
                    child: Text(
                      'Hlis',
                      style: TextStyle(
                        fontFamily: 'tt',
                        fontSize: 50.sp,
                        color: AppColor.primary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 242.5.h,
                    left: 14.w,
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontFamily: 'sf',
                        fontSize: 26.sp,
                        color: AppColor.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 284.57.h,
                    left: 14.w,
                    child: SizedBox(
                      width:
                          MediaQuery.of(context).size.width - 14.w * 2 - 50.w,
                      child: Text(
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, ',
                        style: TextStyle(
                          fontFamily: 'sf',
                          fontSize: 16.sp,
                          color: AppColor.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 29.5.h,
              ),
              Padding(
                padding: EdgeInsets.all(16.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextForm(
                      controller: phone,
                      hintText: 'Phone Number',
                      labelText: 'Phone Number',
                      ispassword: false,
                      action: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (value.length != 10 || !isNumeric(value)) {
                          return 'Please enter a valid 10-digit phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextForm(
                      controller: password,
                      hintText: 'Password',
                      labelText: 'Password',
                      ispassword: isPasswordVisible,
                      // icon: isPasswordVisible
                      //     ? Icons.visibility
                      //     : Icons.visibility_off,
                      icon: isPasswordVisible
                          ? 'assets/svgs/hidepass.svg'
                          : 'assets/svgs/showpass.svg',
                      onicontap: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      action: TextInputAction.done,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 24.5.h,
                    ),
                    CustomTextButton(title: 'Forgot Password?', ontap: () {}),
                    SizedBox(
                      height: 23.h,
                    ),
                    FullButton(
                        title: 'Sign In',
                        ontap: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        bgColor: AppColor.primary,
                        textColor: AppColor.white),
                    SizedBox(
                      height: 63.h,
                    ),
                    Center(
                      child: CustomTextButton(
                          title: "Don't have an account? Sign Up",
                          ontap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String title;
  final Function ontap;
  const CustomTextButton({
    super.key,
    required this.title,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          ontap();
        },
        child: Text(
          title,
          style: TextStyle(
              fontSize: 14.sp, fontWeight: FontWeight.w400, fontFamily: 'sf'),
        ));
  }
}

class CustomTextForm extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  // final IconData? icon;
  final String? icon;
  final bool ispassword;
  final Function? onicontap;
  final TextInputAction action;
  final String? Function(String?)? validator;

  const CustomTextForm({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.ispassword,
    this.icon,
    this.onicontap,
    required this.action,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: action,
      obscureText: ispassword,
      validator: validator,
      style: TextStyle(
          fontFamily: 'sf',
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          color: AppColor.black),
      cursorColor: AppColor.buttonGrey,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            color: AppColor.hintgrey,
            fontFamily: 'sf',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400),
        labelText: labelText,
        labelStyle: TextStyle(
            color: AppColor.hintgrey,
            fontFamily: 'sf',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400),
        // suffixIcon: icon != null && onicontap != null
        //     ? IconButton(
        //         onPressed: () {
        //           onicontap!();
        //         },
        //         icon: Icon(icon))
        //     : null,
        suffixIcon: icon != null && onicontap != null
            ? InkWell(
                onTap: () {
                  onicontap!();
                },
                child: SizedBox(
                  height: 3.h,
                  width: 3.w,
                  child: Center(
                    child: SvgPicture.asset(
                      icon!,
                    ),
                  ),
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.bordergrey, width: 1.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.bordergrey, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.bordergrey, width: 1.w),
        ),
      ),
    );
  }
}
