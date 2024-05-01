// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_27_03/Utils/AppColor.dart';
import 'package:task_27_03/route_setting.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  void initState() {
    super.initState();
    redirectCheck();
  }

  void redirectCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    await Future.delayed(const Duration(seconds: 3));

    if (token != null && token.isNotEmpty) {
      Navigator.pushReplacementNamed(context, MyRouter.home_page);
    } else {
      Navigator.pushReplacementNamed(context, MyRouter.get_started);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.white,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Image(
            image: AssetImage('assets/images/splace.png'),
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
