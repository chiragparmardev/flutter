import 'package:flutter/material.dart';
import 'package:task_27_03/Utils/AppColor.dart';

class CustomFullButton extends StatelessWidget {
  const CustomFullButton({
    super.key,
    required this.ontap,
    required this.title,
  });

  final Function ontap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColor.primary, borderRadius: BorderRadius.circular(50)),
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            onTap: () {
              ontap();
            },
            child: Center(
              child: Text(title,
                  style: const TextStyle(
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ),
          ),
        ),
      ),
    );
  }
}
