// ignore_for_file: use_build_context_synchronously, avoid_print, await_only_futures, unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_27_03/Cutom/Appbar/appbar_custom.dart';
import 'package:task_27_03/Cutom/Button/full_button_custom.dart';
import 'package:task_27_03/Cutom/TextField/text_field_custom.dart';
import 'package:task_27_03/Utils/AppColor.dart';
import 'package:task_27_03/route_setting.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
  void initState() {
    super.initState();
    // getDataFromSharedPreferences();
    getDataFromHive();
  }

  // Future<void> getDataFromSharedPreferences() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   businessName.text = prefs.getString('businessName') ?? '';
  //   firstName.text = prefs.getString('firstname') ?? '';
  //   lastName.text = prefs.getString('lastName') ?? '';
  //   email.text = prefs.getString('email') ?? '';
  //   mobile.text = prefs.getString('phone') ?? '';
  //   zipCode.text = prefs.getString('zipcode') ?? '';
  // }

  Future<void> getDataFromHive() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? mono = await prefs.getString('token');

    // for hive
    // var box = await Hive.openBox('user_data');
    // var userData = await box.get(mono);

    var userData = jsonDecode(localStorage.getItem(mono.toString())!);

    if (userData != null) {
      setState(() {
        businessName.text = userData['businessName'];
        firstName.text = userData['firstName'];
        lastName.text = userData['lastName'];
        email.text = userData['email'];
        mobile.text = userData['phone'];
        zipCode.text = userData['zipcode'];
      });
    } else {
      print(userData);
    }
  }

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
      }, 'Edit Profile'),
      body: SingleChildScrollView(
        child: Padding(
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
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, bottom: 30),
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
              } else {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                String? mono = await prefs.getString('token');

                // await prefs.setString('businessName', businessName.text);
                // await prefs.setString('firstname', firstName.text);
                // await prefs.setString('lastName', lastName.text);
                // await prefs.setString('email', email.text);
                // await prefs.setString('phone', mobile.text);
                // await prefs.setString('zipcode', zipCode.text);

                // for hive
                // var box = await Hive.openBox('user_data');

                // Constructing user data map
                Map<String, dynamic> userDataProfile = {
                  'businessName': businessName.text,
                  'firstName': firstName.text,
                  'lastName': lastName.text,
                  'email': email.text,
                  'phone': mobile.text,
                  'zipcode': zipCode.text,
                };

                // for hive
                // await box.put(mono, userDataProfile);

                var localjsonData = jsonEncode(userDataProfile);
                localStorage.setItem(mono.toString(), localjsonData);

                // Navigator.pop(context);

                var snackBar = const SnackBar(
                    backgroundColor: AppColor.primary,
                    content: Text('Update Profile'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                Navigator.pushNamedAndRemoveUntil(
                    context, MyRouter.manage_address, (route) => false);
              }
            },
            title: 'Update'),
      ),
    );
  }
}
