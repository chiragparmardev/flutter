import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_2_03/CustomComponents.dart/button.dart';
import 'package:task_2_03/CustomComponents.dart/size_box.dart';
import 'package:task_2_03/CustomComponents.dart/text_field.dart';
import 'package:task_2_03/Design_three.dart';
import 'package:task_2_03/Utility/AppColor.dart';

class DesignTwo extends StatefulWidget {
  const DesignTwo({super.key});

  @override
  State<DesignTwo> createState() => _DesignTwoState();
}

class _DesignTwoState extends State<DesignTwo> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.grey,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              SB.sbh(80),
              Center(
                child: Text(
                  'Welcome Back',
                  style: TextStyle(
                      color: AppColor.black,
                      fontSize: 45,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Text(
                'Enter your credential to login',
                style: TextStyle(
                    color: AppColor.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              SB.sbh(80),
              TextFormFieldCustom(
                hinttext: 'username',
                icon: Icons.person,
                controller: username,
                isSecondTextField: true,
              ),
              SB.sbh(10),
              TextFormFieldCustom(
                hinttext: 'Password',
                icon: Icons.password,
                controller: password,
                isSecondTextField: true,

              ),
              SB.sbh(10),
              ButtonFull(
                  bgColor: AppColor.secondary,
                  radius: 50,
                  title: 'Login',
                  ontap: () {
                    if (username.text.isNotEmpty && password.text.isNotEmpty) {
                      username.clear();
                      password.clear();
                    } else {
                      var snackBar = const SnackBar(
                        content: Text('Please Enter a field'),
                        backgroundColor: Colors.red,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }),
              SB.sbh(80),
              TextButtonCustom(
                title: 'Forgot Password?',
                ontap: () {},
                subTitle: '',
              ),
              SB.sbh(80),
              TextButtonCustom(
                title: 'Sign Up',
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DesignThree()));
                },
                subTitle: 'Dont have an account?',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
