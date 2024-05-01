// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task_27_03/Utils/AppColor.dart';
import 'package:task_27_03/route_setting.dart';

class OrderConfirm extends StatefulWidget {
  const OrderConfirm({super.key});

  @override
  State<OrderConfirm> createState() => _OrderConfirmState();
}

class _OrderConfirmState extends State<OrderConfirm> {
  @override
  void initState() {
    super.initState();
    redirectCheck();
  }

  void redirectCheck() async {
    await Future.delayed(const Duration(seconds: 2));

    Navigator.pushNamedAndRemoveUntil(
        context, MyRouter.home_page, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/json/order_confirm.json', height: 200),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'On The Way!..',
              style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
