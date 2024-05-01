import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_27_03/Cutom/Button/full_button_custom.dart';
import 'package:task_27_03/Cutom/TextField/text_field_custom.dart';
import 'package:task_27_03/Utils/AppColor.dart';
import 'package:task_27_03/route_setting.dart';

class MobileLogin extends StatefulWidget {
  const MobileLogin({super.key});

  @override
  State<MobileLogin> createState() => _MobileLoginState();
}

class _MobileLoginState extends State<MobileLogin> {
  TextEditingController mobile = TextEditingController();

  var statusbar =
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColor.white,
    statusBarIconBrightness: Brightness.light,
  ));

  @override
  void initState() {
    super.initState();
    statusbar;
  }

  @override
  void dispose() {
    super.dispose();
    mobile.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Center(
                      child: Image.asset(
                    'assets/images/splace.png',
                    height: 200,
                    fit: BoxFit.cover,
                  )),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFieldCustom(
                  controller: mobile,
                  hint: "Phone Number",
                  keyboard: TextInputType.phone,
                ),
                // CustomTextFieldMobile(mobile: mobile),
                const SizedBox(
                  height: 12,
                ),
                CustomFullButton(
                  ontap: () {
                    if (mobile.text.length == 10) {
                      Navigator.pushNamed(context, MyRouter.otp,
                          arguments: mobile.text.toString());
                    } else {
                      var snackBar = const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('please enter valid mobile number'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  title: 'Login',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
