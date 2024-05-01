import 'package:flutter/material.dart';
import 'package:task_27_03/Cutom/Appbar/appbar_custom.dart';
import 'package:task_27_03/Cutom/Widgets/custom_notification_card.dart';
import 'package:task_27_03/Utils/AppColor.dart';

class Notification {
  final String title;
  final String? subtitle;
  final String time;

  Notification({required this.title, this.subtitle, required this.time});
}

List<Notification> notificationList = [
  Notification(
      title: 'Your order has been successfully placed!',
      subtitle: 'Order Id : ABC1234',
      time: '3:00 pm'),
  Notification(
      title: 'Admin was Deleted unnecessary product', time: '12:00 Pm'),
];

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greyBg,
      appBar: uiHelper.CustomAppbar(() {
        Navigator.pop(context);
      }, 'Notifications'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: List.generate(
              notificationList.length,
              (index) => CustomNotificationTile(
                    title: notificationList[index].title,
                    time: notificationList[index].time,
                    subtitle: notificationList[index].subtitle,
                  )),
        ),
      ),
    );
  }
}
