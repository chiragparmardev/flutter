import 'package:flutter/material.dart';
import 'package:task_27_03/Utils/AppColor.dart';

class CustomNotificationTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String time;
  const CustomNotificationTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: AppColor.black.withOpacity(0.1),
                offset: const Offset(0, 0),
                blurRadius: 5)
          ]),
      child: ListTile(
          leading: Container(
            width: 37,
            height: 37,
            decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(50)),
            child: const Center(
              child: Icon(
                Icons.notifications,
                color: AppColor.white,
                size: 20,
              ),
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          // trailing: subtitle == null
          //     ? Text(
          //         time,
          //         style: const TextStyle(
          //             color: AppColor.grey500,
          //             fontSize: 12,
          //             fontWeight: FontWeight.w400),
          //       )
          //     : null,
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              subtitle == null
                  ? const SizedBox()
                  : Text(
                      subtitle!,
                      style: const TextStyle(
                          color: AppColor.grey500,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
              Text(
                time,
                style: const TextStyle(
                    color: AppColor.grey500,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              )
            ],
          )),
    );
  }
}
