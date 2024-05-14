import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  TextEditingController chatEditingController = TextEditingController();

  final List<Map<String, dynamic>> userProfiles = [
    {
      "user_id": 1,
      "username": "Walmart",
      "image":
          "https://www.vmcdn.ca/f/files/localprofile/import/2023_04_shutterstock_2033960729-scaled.jpg",
    },
    {
      "user_id": 2,
      "username": "Stop & Shop",
      "image":
          "https://www.supermarketnews.com/sites/supermarketnews.com/files/styles/article_featured_retina/public/Stop__Shop_new_look_store_banner_0.png?itok=HBTGic60",
    },
  ];

  final List<Map<String, dynamic>> chatData = [
    {
      "user_id": 1,
      "timestamp": "2024-05-08 08:30:00",
      "read_status": 2,
      "message": "Hello there! send",
      "is_sender": true
    },
    {
      "user_id": 1,
      "timestamp": "2024-05-09 08:30:00",
      "read_status": 2,
      "message": "Hello there! send",
      "is_sender": true
    },
    {
      "user_id": 2,
      "timestamp": "2024-05-09 08:32:00",
      "read_status": 0,
      "message": "Hi! How are you?",
      "is_sender": true
    },
    {
      "user_id": 1,
      "timestamp": "2024-05-10 09:35:00",
      "message": "I'm good, thanks!",
      "is_sender": false
    },
    {
      "user_id": 1,
      "timestamp": "2024-05-10 09:35:00",
      "message": "I'm good,!",
      "read_status": 1,
      "is_sender": true
    },
  ];

  List<Map<String, dynamic>> getChatDataForUserProfile(int userProfileIndex) {
    final userProfileId = userProfiles[userProfileIndex]['user_id'];
    return chatData.where((data) => data['user_id'] == userProfileId).toList();
  }

  int getUnreadCount(int userProfileIndex) {
    final userProfileId = userProfiles[userProfileIndex]['user_id'];
    return chatData
        .where((data) =>
            data['user_id'] == userProfileId && data['read_status'] == 1)
        .length;
  }

  String getLastMessage(int userProfileIndex) {
    final userProfileId = userProfiles[userProfileIndex]['user_id'];
    final userChatData =
        chatData.where((data) => data['user_id'] == userProfileId).toList();
    if (userChatData.isNotEmpty) {
      return userChatData.last['message'];
    }
    return "";
  }

  String getFormattedDate(DateTime date) {
    DateTime now = DateTime.now();
    DateTime yesterday = DateTime(now.year, now.month, now.day - 1);
    DateTime today = DateTime(now.year, now.month, now.day);

    if (date.year == today.year &&
        date.month == today.month &&
        date.day == today.day) {
      return 'Today';
    } else if (date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day) {
      return 'Yesterday';
    } else {
      return '${date.day} ${getMonthName(date.month)}';
    }
  }

  String getMonthName(int month) {
    List<String> monthNames = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    if (month >= 1 && month <= 12) {
      return monthNames[month];
    } else {
      return '';
    }
  }

  String getTime(String timestamp) {
    DateTime dateTime = DateTime.parse(timestamp);
    String hour = (dateTime.hour % 12).toString();
    if (hour == '0') {
      hour = '12';
    }
    String minute = dateTime.minute.toString();
    if (minute.length == 1) {
      minute = '0$minute';
    }
    String period = dateTime.hour < 12 ? 'am' : 'pm';
    return '$hour:$minute $period';
  }

  String getLastMessageTimeAgo(int userProfileIndex) {
    final userProfileId = userProfiles[userProfileIndex]['user_id'];
    final userChatData =
        chatData.where((data) => data['user_id'] == userProfileId).toList();
    if (userChatData.isNotEmpty) {
      DateTime lastMessageTime = DateTime.parse(userChatData.last['timestamp']);
      Duration difference = DateTime.now().difference(lastMessageTime);
      int minutes = difference.inMinutes;
      if (minutes == 0) {
        return 'now';
      } else if (minutes < 60) {
        return '$minutes min';
      } else {
        int hours = minutes ~/ 60;
        return '$hours hr';
      }
    }
    return "";
  }

  void sendMessage(String message, int userProfileIndex) {
    Map<String, dynamic> chat = {
      "user_id": 1,
      "timestamp": DateTime.now().toString(),
      "message": message,
      'read_status': 0,
      "is_sender": true
    };
    chatData.add(chat);
    chatEditingController.clear();
    notifyListeners();
  }
}

class ChatUserDetails {
  final String index;
  final String img;
  final String username;

  ChatUserDetails(
      {required this.index, required this.img, required this.username});
}
