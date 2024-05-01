import 'package:flutter/material.dart';
import 'package:task_2_03/Utility/AppColor.dart';

class ButtonFull extends StatelessWidget {
  final Color bgColor;
  final String title;
  final double radius;
  final Function ontap;

  const ButtonFull(
      {super.key,
      required this.bgColor,
      required this.radius,
      required this.title,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: bgColor),
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            onTap: () {
              ontap();
            },
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                    color: AppColor.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextButtonCustom extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function ontap;
  const TextButtonCustom(
      {super.key,
      required this.title,
      required this.ontap,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          subTitle,
          style: TextStyle(color: AppColor.black, fontSize: 17),
        ),
        TextButton(
            onPressed: () {
              ontap();
            },
            child: Text(
              title,
              style: TextStyle(
                  color: AppColor.secondary,
                  fontWeight: FontWeight.w600,
                  fontSize: 17),
            )),
      ],
    );
  }
}

class ButtonFullBorder extends StatelessWidget {
  final Color borderColor;
  final String title;
  final double radius;
  final Function ontap;
  const ButtonFullBorder(
      {super.key,
      required this.borderColor,
      required this.radius,
      required this.title,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: Colors.transparent,
          border: Border.all(color: AppColor.secondary, width: 2)),
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            onTap: () {
              ontap();
            },
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                    color: AppColor.secondary,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
