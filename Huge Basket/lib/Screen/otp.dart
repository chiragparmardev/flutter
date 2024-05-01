// ignore_for_file: must_be_immutable, use_build_context_synchronously, await_only_futures, unused_import

import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_27_03/Cutom/Button/full_button_custom.dart';
import 'package:task_27_03/Utils/AppColor.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:task_27_03/Cutom/Appbar/appbar_custom.dart';
import 'package:get/get.dart';
import 'package:task_27_03/route_setting.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  int otp = 0;
  int validOtp = Random().nextInt(9000) + 1000;
  bool wrongOtp = false;
  int generateRandomOTP() {
    return Random().nextInt(9000) + 1000;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getSnackbarLoad(validOtp);
    });
  }

  void getSnackbarLoad(int validOtp) {
    Get.snackbar(
      'Huge basket',
      'Valid OTP is: $validOtp',
      icon: const Icon(
        Icons.shopify_outlined,
        color: AppColor.primary,
        size: 40,
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColor.greenLight200,
      duration: const Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mobileno = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: uiHelper.CustomAppbar(() {
        Navigator.pop(context);
      }, 'Verification Code'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Verification code has been send on your registered mobile number. Enter \nVerification code here.',
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColor.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              OtpTextField(
                margin: const EdgeInsets.only(right: 15),
                fillColor: AppColor.grey,
                filled: true,
                numberOfFields: 4,
                keyboardType: TextInputType.number,
                fieldHeight: 60,
                fieldWidth: 60,
                clearText: true,
                focusedBorderColor: AppColor.primary,
                showCursor: false,
                hasCustomInputDecoration: true,
                decoration: InputDecoration(
                    isDense: true,
                    // contentPadding: EdgeInsets.all(16),
                    alignLabelWithHint: true,
                    filled: true,
                    fillColor: const Color(0xffF3F4F6),
                    hintText: "-",
                    counterText: "",
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 0, style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(50))),
                borderRadius: BorderRadius.circular(50),
                enabledBorderColor: Colors.transparent,
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  otp = int.parse(verificationCode);

                  // showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return AlertDialog(
                  //         content: Text('Code entered is $verificationCode'),
                  //       );
                  //     });
                },
              ),
              const SizedBox(
                height: 80,
              ),
              CustomFullButton(
                  ontap: () async {
                    if (otp.toString().length != 4 || otp != validOtp) {
                      setState(() {
                        wrongOtp = true;
                      });
                      var snackBar = const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('please enter valid otp'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setString('token', mobileno);

                      String? mono = await prefs.getString('token');

                      var locaJsonDecodeData =
                          localStorage.getItem(mono.toString());

                      // for hive
                      // var box = await Hive.openBox('user_data');
                      // var userData = await box.get(mono);
                      // userData == null

                      locaJsonDecodeData == null
                          ? Navigator.pushReplacementNamed(
                              context, MyRouter.add_more_details)
                          : Navigator.pushReplacementNamed(
                              context, MyRouter.home_page);
                    }
                  },
                  title: 'Verify'),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  validOtp = generateRandomOTP();
                  getSnackbarLoad(validOtp);
                },
                child: const Text(
                  'Resend Code',
                  style: TextStyle(
                      color: AppColor.black,
                      decoration: TextDecoration.underline,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/splace.png',
                height: 180,
                fit: BoxFit.contain,
                opacity: const AlwaysStoppedAnimation(0.5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
