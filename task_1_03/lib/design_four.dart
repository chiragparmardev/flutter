import 'package:flutter/material.dart';
import 'package:task_1_03/AppColor.dart';

class DesignFour extends StatefulWidget {
  const DesignFour({super.key});

  @override
  State<DesignFour> createState() => _DesignFourState();
}

class _DesignFourState extends State<DesignFour> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.buttonColor,
        title: Text(
          'TextField FirstApp',
          style: TextStyle(color: AppColor.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: username,
                decoration: InputDecoration(
                  hintText: 'Your Username',
                  labelText: 'Your Username',
                  floatingLabelStyle: TextStyle(color: AppColor.buttonColor),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.buttonColor, width: 2.0)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: password,
                decoration: InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password',
                  floatingLabelStyle: TextStyle(color: AppColor.buttonColor),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.buttonColor, width: 2.0)),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                onPressed: () {},
                child: Text(
                  'Sign In',
                  style: TextStyle(color: AppColor.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
