import 'package:flutter/material.dart';
import 'package:task_2_03/CustomComponents.dart/button.dart';
import 'package:task_2_03/CustomComponents.dart/size_box.dart';
import 'package:task_2_03/CustomComponents.dart/text_field.dart';
import 'package:task_2_03/Utility/AppColor.dart';

class DesignOne extends StatefulWidget {
  const DesignOne({super.key});

  @override
  State<DesignOne> createState() => _DesignOneState();
}

class _DesignOneState extends State<DesignOne> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController city = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.primary,
          title: Text(
            'Flutter Forms',
            style: TextStyle(
                color: AppColor.white,
                fontWeight: FontWeight.w500,
                fontSize: 25),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormFieldCustom(
                    hinttext: 'Name',
                    labeltext: 'Name',
                    icon: Icons.contact_page_outlined,
                    controller: name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please fill this field';
                      }
                      return null;
                    },
                    isSecondTextField: false,
                  ),
                  SB.sbh(15),
                  TextFormFieldCustom(
                    hinttext: 'Email Address',
                    labeltext: 'Email Address',
                    icon: Icons.email_outlined,
                    controller: email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please fill this field';
                      }

                      RegExp regExp = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (!regExp.hasMatch(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                    isSecondTextField: false,
                  ),
                  SB.sbh(15),
                  TextFormFieldCustom(
                    hinttext: 'Phone Number',
                    labeltext: 'Phone Number',
                    textInputType: TextInputType.number,
                    icon: Icons.phone_android_outlined,
                    controller: phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please fill this field';
                      }
                      if (value.length != 10) {
                        return 'Please Enter a 10 number';
                      }
                      return null;
                    },
                    isSecondTextField: false,
                  ),
                  SB.sbh(15),
                  TextFormFieldCustom(
                    hinttext: 'Street Address',
                    labeltext: 'Street Address',
                    icon: Icons.streetview_outlined,
                    controller: street,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please fill this field';
                      }
                      return null;
                    },
                    isSecondTextField: false,
                  ),
                  SB.sbh(15),
                  TextFormFieldCustom(
                    hinttext: 'City',
                    labeltext: 'City',
                    icon: Icons.location_city_outlined,
                    controller: city,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please fill this field';
                      }

                      return null;
                    },
                    isSecondTextField: false,
                  ),
                  SB.sbh(15),
                  ButtonFull(
                      bgColor: AppColor.primary,
                      radius: 10,
                      title: 'Submit',
                      ontap: () {
                        if (_formKey.currentState!.validate()) {
                          name.clear();
                          email.clear();
                          phone.clear();
                          street.clear();
                          city.clear();
                        }
                      }),
                  SB.sbh(15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
