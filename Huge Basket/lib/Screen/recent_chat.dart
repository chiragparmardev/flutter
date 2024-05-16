import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_27_03/Cutom/Appbar/appbar_custom.dart';
import 'package:task_27_03/Utils/AppColor.dart';
import 'package:task_27_03/providers/chat_provider.dart';
import 'package:task_27_03/route_setting.dart';

class RecentChat extends StatefulWidget {
  const RecentChat({super.key});

  @override
  State<RecentChat> createState() => _RecentChatState();
}

class _RecentChatState extends State<RecentChat> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.greyBg,
        appBar: uiHelper.CustomAppbar(() {
          Navigator.pop(context);
        }, 'Recent Chat'),
        body: Consumer<ChatProvider>(
          builder: (context, value, child) {
            return ListView(
              children: List.generate(value.userProfiles.length, (index) {
                final userProfile = value.userProfiles[index];
                        final unreadMessageCount =
                    value.getUnreadCount(index);
                    final lastMessage = value.getLastMessage(index);
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        value.markMessagesAsRead(userProfile['user_id']);
                        Navigator.pushNamed(context, MyRouter.chat,
                        arguments: ChatUserDetails(index: userProfile['user_id'].toString(), img: userProfile['image'] , username: userProfile['username'])
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        height: 64,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                              height: 64,
                              width: 64,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                  image: DecorationImage(
                                      image: NetworkImage(userProfile['image']),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          userProfile['username'],
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: AppColor.black),
                                        ),
                                        const Spacer(),
                                         Text(
                                          value.getLastMessageTimeAgo(index),
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: AppColor.grey200),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                         Expanded(
                                          child: Text(
                                             lastMessage,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: AppColor.grey200),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(left: 30),
                                          width: 24,
                                          height: 24,
                                          decoration: BoxDecoration(
                                              color: unreadMessageCount == 0? Colors.transparent:AppColor.black,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child:  Center(
                                            child: Text(
                                              unreadMessageCount == 0 ? "": unreadMessageCount.toString(),
                                              style: const TextStyle(
                                                color: AppColor.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 104, right: 20),
                      child: Divider(
                          thickness: 1,
                          height: 1,
                          color: AppColor.greyLightShadow200),
                    )
                  ],
                );
              }),
            );
          },
        ));
  }
}
