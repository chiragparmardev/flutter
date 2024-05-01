import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_2_03/CustomComponents.dart/button.dart';
import 'package:task_2_03/CustomComponents.dart/size_box.dart';
import 'package:task_2_03/CustomComponents.dart/text_field.dart';
import 'package:task_2_03/Utility/AppColor.dart';
import 'package:task_2_03/design_two.dart';

class DesignThree extends StatefulWidget {
  const DesignThree({super.key});

  @override
  State<DesignThree> createState() => _DesignThreeState();
}

class _DesignThreeState extends State<DesignThree> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
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
                  'Sign up',
                  style: TextStyle(
                      color: AppColor.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SB.sbh(15),
              Text(
                'Create your account',
                style: TextStyle(
                    color: AppColor.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              SB.sbh(25),
              TextFormFieldCustom(
                hinttext: 'Username',
                icon: Icons.person,
                controller: username,
                isSecondTextField: true,
              ),
              SB.sbh(20),
              TextFormFieldCustom(
                hinttext: 'Email',
                icon: Icons.email,
                controller: email,
                isSecondTextField: true,
              ),
              SB.sbh(20),
              TextFormFieldCustom(
                hinttext: 'Password',
                icon: Icons.password,
                controller: password,
                isSecondTextField: true,
              ),
              SB.sbh(20),
              TextFormFieldCustom(
                hinttext: 'Confirm Password',
                icon: Icons.password,
                controller: confirmPassword,
                isSecondTextField: true,
              ),
              SB.sbh(20),
              ButtonFull(
                  bgColor: AppColor.secondary,
                  radius: 50,
                  title: 'Sign up',
                  ontap: () {
                    RegExp regExp = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                    if (username.text.isEmpty ||
                        password.text.isEmpty ||
                        email.text.isEmpty ||
                        confirmPassword.text.isEmpty) {
                      var snackBar = const SnackBar(
                        content: Text('Please Enter a field'),
                        backgroundColor: Colors.red,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (!regExp.hasMatch(email.text)) {
                      var snackBar = const SnackBar(
                        content: Text('Please Enter a valid email address'),
                        backgroundColor: Colors.red,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (password.text != confirmPassword.text ) {
                      var snackBar = const SnackBar(
                        content: Text('Passwords do not match'),
                        backgroundColor: Colors.red,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    } else {
                      username.clear();
                      email.clear();
                      password.clear();
                      confirmPassword.clear();
                    }
                  }),
              SB.sbh(25),
              Text(
                'Or',
                style: TextStyle(
                    color: AppColor.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
              SB.sbh(25),
              ButtonFullBorder(
                  borderColor: AppColor.secondary,
                  radius: 50,
                  title: 'Sign In With google',
                  ontap: () {}),
              SB.sbh(25),
              TextButtonCustom(
                title: 'Login',
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DesignTwo()));
                },
                subTitle: 'Already have an account?',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
