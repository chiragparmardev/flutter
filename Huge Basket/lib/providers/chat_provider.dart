import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ChatProvider extends ChangeNotifier {
  TextEditingController chatEditingController = TextEditingController();

  final List<Map<String, dynamic>> userProfiles = [
    {
      "user_id": 0,
      "username": "Walmart",
      "image":
          "https://www.vmcdn.ca/f/files/localprofile/import/2023_04_shutterstock_2033960729-scaled.jpg",
    },
    {
      "user_id": 1,
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
      "message": "Hello ",
      "is_sender": true
    },
    {
      "user_id": 0,
      "timestamp": "2024-05-09 08:30:00",
      "read_status": 2,
      "message": "Hi ! How are you?",
      "is_sender": false
    },
    {
      "user_id": 1,
      "timestamp": "2024-05-09 08:32:00",
      "read_status": 0,
      "message": "Hi! How are you?",
      "is_sender": true
    },
    {
      "user_id": 0,
      "timestamp": "2024-05-10 09:35:00",
      "message": "I'm good, thanks!",
      "read_status": 2,
      "is_sender": true
    },
    {
      "user_id": 0,
      "timestamp": "2024-05-10 09:35:00",
      "message": "I'm good,!",
      "read_status": 1,
      "is_sender": false
    },
  ];


  List<Map<String, dynamic>> getChatDataForUserProfile(int userProfileIndex) {
    final userProfileId = userProfiles[userProfileIndex]['user_id'];
    return chatData.where((data) => data['user_id'] == userProfileId ).toList();
  }
  

  int getUnreadCount(int userProfileIndex) {
    final userProfileId = userProfiles[userProfileIndex]['user_id'];
    var unread =  chatData
        .where((data) =>
            data['user_id'] == userProfileId  &&
            data['read_status'] == 1
            && data['is_sender'] == false
            )
        .length;
        return  unread;
  }

  void markMessagesAsRead(int userProfileIndex) {
    final userProfileId = userProfiles[userProfileIndex]['user_id'];

    for (var data in chatData) {
      if (data['user_id'] == userProfileId && data['is_sender'] == false) {
        data['read_status'] = 2;
      }
    }
    notifyListeners();
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
      return '${DateFormat.d().format(date)} ${DateFormat.MMMM().format(date)}';
    }
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
      "user_id": userProfileIndex,
      "timestamp": DateTime.now().toString(),
      "message": message,
      'read_status': 0,
      "is_sender": true
    };
    chatData.add(chat);
    chatEditingController.clear();
    notifyListeners();
  }

  void receiveMessage(String message, int userProfileIndex) {
    Map<String, dynamic> chat = {
      "user_id": userProfileIndex,
      "timestamp": DateTime.now().toString(),
      "message": message,
      'read_status': 2,
      "is_sender": false
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
