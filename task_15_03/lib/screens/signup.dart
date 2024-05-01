import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_15_03/AppColor.dart';
import 'package:task_15_03/screens/signin.dart';
import 'package:task_15_03/screens/welcome.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  bool isPasswordVisible = false;
  bool iscPasswordVisible = false;
  bool isChecked = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isNumeric(String? str) {
    if (str == null) {
      return false;
    }
    return int.tryParse(str) != null;
  }

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 34.h,
                    ),
                    Container(
                      height: 31.h,
                      width: 31.w,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: AppColor.bordergrey,
                                blurRadius: 3,
                                offset: const Offset(0, 3))
                          ],
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
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      'Create Account',
                      style: TextStyle(
                        fontFamily: 'sf',
                        fontSize: 26.sp,
                        color: AppColor.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Text(
                      'Sign up to continue to our app',
                      style: TextStyle(
                        fontFamily: 'sf',
                        fontSize: 16.sp,
                        color: AppColor.textlightcolor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 31.h,
                    ),
                    CustomTextForm(
                      controller: name,
                      hintText: 'Name',
                      labelText: 'Name',
                      ispassword: false,
                      action: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
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
                        if (!isNumeric(value) || value.length != 10) {
                          return 'Please enter a valid 10-digit phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextForm(
                      controller: email,
                      hintText: 'Email',
                      labelText: 'Email',
                      ispassword: false,
                      action: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!isValidEmail(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextForm(
                      controller: password,
                      hintText: 'Password',
                      labelText: 'Password',
                      ispassword: isPasswordVisible,
                      action: TextInputAction.next,
                      icon: isPasswordVisible
                          ? 'assets/svgs/hidepass.svg'
                          : 'assets/svgs/showpass.svg',
                      onicontap: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextForm(
                      controller: cpassword,
                      hintText: 'Confirm Password',
                      labelText: 'Confirm Password',
                      ispassword: iscPasswordVisible,
                      action: TextInputAction.done,
                      icon: iscPasswordVisible
                          ? 'assets/svgs/hidepass.svg'
                          : 'assets/svgs/showpass.svg',
                      onicontap: () {
                        setState(() {
                          iscPasswordVisible = !iscPasswordVisible;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != password.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.w),
                child: Row(
                  children: [
                    Checkbox(
                      checkColor: AppColor.white,
                      activeColor: AppColor.primary,
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Flexible(
                      child: Text(
                        'I agree with Terms & Conditions and Privacy Policy ',
                        style: TextStyle(
                            fontFamily: 'sf',
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: AppColor.textlightcolor),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 53.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                child: FullButton(
                    title: 'Sign Up',
                    ontap: () {
                      if (!isChecked) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 8.0),
                                Text(
                                  'Please agree to Terms & Conditions and Privacy Policy',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 10),
                                ),
                              ],
                            ),
                            backgroundColor: Colors.white,
                          ),
                        );
                      } else {
                        if (_formKey.currentState!.validate()) {
                          name.clear();
                          phone.clear();
                          email.clear();
                          password.clear();
                          cpassword.clear();
                          isPasswordVisible = false;
                          iscPasswordVisible = false;
                          setState(() {
                            isChecked = false;
                          });
                        }
                      }
                    },
                    bgColor: AppColor.primary,
                    textColor: AppColor.white),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
