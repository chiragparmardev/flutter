// ignore_for_file: use_build_context_synchronously, avoid_print, await_only_futures, unused_import

import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_27_03/Cutom/Appbar/appbar_custom.dart';
import 'package:task_27_03/Cutom/Button/full_button_custom.dart';
import 'package:task_27_03/Cutom/TextField/text_field_custom.dart';
import 'package:task_27_03/Utils/AppColor.dart';
import 'package:localstorage/localstorage.dart';
import 'package:task_27_03/route_setting.dart';

class AddMoreDetails extends StatefulWidget {
  const AddMoreDetails({super.key});

  @override
  State<AddMoreDetails> createState() => _AddMoreDetailsState();
}

class _AddMoreDetailsState extends State<AddMoreDetails> {
  TextEditingController businessName = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController zipCode = TextEditingController();

  final FocusNode businessNameFocusNode = FocusNode();
  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode mobileFocusNode = FocusNode();
  final FocusNode zipCodeFocusNode = FocusNode();

  @override
  void dispose() {
    businessNameFocusNode.dispose();
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    emailFocusNode.dispose();
    mobileFocusNode.dispose();
    zipCodeFocusNode.dispose();
    businessName.dispose();
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    mobile.dispose();
    zipCode.dispose();
    super.dispose();
  }

  bool agree = false;

  bool _isValidEmail(String email) {
    final RegExp regex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      caseSensitive: false,
      multiLine: false,
    );
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: uiHelper.CustomAppbar(() {
        Navigator.pop(context);
      }, 'Add More Details'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFieldCustom(
                    controller: businessName,
                    hint: "Business Name",
                    focusNode: businessNameFocusNode,
                    nextFocusNode: firstNameFocusNode,
                  ),
                  TextFieldCustom(
                    controller: firstName,
                    hint: "First Name",
                    focusNode: firstNameFocusNode,
                    nextFocusNode: lastNameFocusNode,
                  ),
                  TextFieldCustom(
                    controller: lastName,
                    hint: "last Name",
                    focusNode: lastNameFocusNode,
                    nextFocusNode: emailFocusNode,
                  ),
                  TextFieldCustom(
                    controller: email,
                    hint: "Email Address",
                    focusNode: emailFocusNode,
                    nextFocusNode: mobileFocusNode,
                  ),
                  TextFieldCustom(
                    controller: mobile,
                    hint: "Phone Number",
                    keyboard: TextInputType.phone,
                    action: TextInputAction.next,
                    focusNode: mobileFocusNode,
                    nextFocusNode: zipCodeFocusNode,
                  ),
                  TextFieldCustom(
                    controller: zipCode,
                    hint: "Zipcode",
                    focusNode: zipCodeFocusNode,
                    nextFocusNode: FocusNode(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 20, top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    splashRadius: 0,
                    activeColor: AppColor.primary,
                    value: agree,
                    onChanged: (value) {
                      setState(() {
                        agree = value!;
                      });
                    },
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'I agree to the ',
                        style: const TextStyle(
                            color: AppColor.grey500, fontSize: 16),
                        children: [
                          TextSpan(
                            text: 'Terms & Condition',
                            style: const TextStyle(
                                color: AppColor.primary,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => print('Tap Here onTap'),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CustomFullButton(
                  ontap: () async {
                    if (businessName.text.isEmpty ||
                        firstName.text.isEmpty ||
                        lastName.text.isEmpty ||
                        email.text.isEmpty ||
                        mobile.text.isEmpty ||
                        zipCode.text.isEmpty) {
                      var snackBar = const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('please enter valid details'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (!_isValidEmail(email.text)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Please enter a valid email address'),
                        ),
                      );
                    } else if (mobile.text.length != 10) {
                      var snackBar = const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('please enter valid mobile number'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (agree == false) {
                      var snackBar = const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('please agree to terms and condition'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      var snackBar = const SnackBar(
                          backgroundColor: AppColor.primary,
                          content: Text('Details Add'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      String? mono = await prefs.getString('token');
                      // await prefs.setString('businessName', businessName.text);
                      // await prefs.setString('firstname', firstName.text);
                      // await prefs.setString('lastName', lastName.text);
                      // await prefs.setString('email', email.text);
                      // await prefs.setString('phone', mobile.text);
                      // await prefs.setString('zipcode', zipCode.text);

                      // --------------------------
                      // var box = await Hive.openBox('user_data');
                      // --------------------------

                      Map<String, dynamic> userDataProfile = {
                        'businessName': businessName.text,
                        'firstName': firstName.text,
                        'lastName': lastName.text,
                        'email': email.text,
                        'phone': mobile.text,
                        'zipcode': zipCode.text,
                      };

                      var localjsonData = jsonEncode(userDataProfile);
                      localStorage.setItem(mono.toString(), localjsonData);

                      // --------------------------
                      // for hive
                      // // Storing user data using phone number as key
                      // await box.put(mono, userDataProfile);

                      // var userData = await box.get(mono);
                      // if (userData != null) {
                      //   print(userData);
                      // } else {
                      //   print('No user data found for token: $mono');
                      // }
                      // --------------------------

                      Navigator.pushNamedAndRemoveUntil(
                          context, MyRouter.home_page, (route) => false);
                    }
                  },
                  title: 'Add'),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
