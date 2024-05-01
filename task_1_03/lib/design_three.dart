// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:task_1_03/AppColor.dart';
import 'package:task_1_03/design_four.dart';

class DesignThree extends StatefulWidget {
  const DesignThree({super.key});

  @override
  State<DesignThree> createState() => _DesignThreeState();
}

class _DesignThreeState extends State<DesignThree> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 15, bottom: 15, left: 10, right: 10),
                decoration: BoxDecoration(
                  color: AppColor.backgroundColor, // Background color
                  borderRadius: BorderRadius.circular(35.0),
                ),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: AppColor.buttonColor,
                      size: 25,
                    ),
                    hintText: 'Username',
                    hintStyle: const TextStyle(fontSize: 20),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: password,
                obscureText: isPassword,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(26),
                  fillColor: AppColor.backgroundColor,
                  filled: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Icon(
                      Icons.lock,
                      color: AppColor.buttonColor,
                      size: 25,
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      icon: Icon(
                        isPassword ? Icons.visibility_off : Icons.visibility,
                        color: AppColor.grey,
                        size: 30,
                      ),
                    ),
                  ),
                  hintText: 'Password',
                  hintStyle: const TextStyle(fontSize: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColor.buttonColor,
                    borderRadius: BorderRadius.circular(35)),
                clipBehavior: Clip.hardEdge,
                child: Material(
                  color: Colors.transparent,
                  child: Ink(
                    child: InkWell(
                      onTap: () {
                        if (email.text.isNotEmpty && password.text.isNotEmpty) {
                          email.clear();
                          password.clear();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DesignFour()));
                        } else {
                          var snackBar = const SnackBar(
                            content: Text('Please Enter a field'),
                            backgroundColor: Colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }

                        setState(() {});
                      },
                      child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
