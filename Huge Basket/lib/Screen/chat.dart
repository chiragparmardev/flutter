import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_27_03/Utils/AppColor.dart';
import 'package:task_27_03/providers/chat_provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    var arguments =
        ModalRoute.of(context)!.settings.arguments as ChatUserDetails;
    String userImage = arguments.img;
    String userName = arguments.username;
    String userIndex = arguments.index;
    return Scaffold(
      backgroundColor: AppColor.greyBg,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 6,
                blurRadius: 6,
                offset: const Offset(0, -6),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: AppColor.white,
            automaticallyImplyLeading: false,
            scrolledUnderElevation: 0,
            title: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                          image: NetworkImage(userImage), fit: BoxFit.cover)),
                ),
                Text(
                  userName,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColor.black),
                )
              ],
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded)),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Consumer<ChatProvider>(builder: (context, value, child) {
            final chatUserData =
                value.getChatDataForUserProfile(int.parse(userIndex));
            return SingleChildScrollView(
              reverse: true,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Column(
                        children: List.generate(chatUserData.length, (index) {
                      final message = chatUserData[index]['message'];
                      final status = chatUserData[index]['read_status'];
                      final isSender = chatUserData[index]['is_sender'];
                      final chatsdate =
                          DateTime.parse(chatUserData[index]['timestamp']);

                      return Column(
                          crossAxisAlignment: isSender
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            if (index == 0 || 
                                DateTime.parse(
                                        chatUserData[index]['timestamp'].toString().substring(0,10)) !=
                                    DateTime.parse(
                                        chatUserData[index - 1]['timestamp']
                                        .toString()
                                        .substring(0, 10)))
                              Center(
                                  child: Text(
                                value.getFormattedDate(chatsdate),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              )),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 27, vertical: 14),
                              margin: EdgeInsets.only(
                                  left: isSender ? 106 : 0,
                                  right: isSender ? 0 : 106),
                              decoration: BoxDecoration(
                                  color: isSender
                                      ? AppColor.chatIsSederBackground
                                      : AppColor.chatIsReceiverBackground,
                                  borderRadius: BorderRadius.only(
                                    topLeft: const Radius.circular(19),
                                    topRight: const Radius.circular(19),
                                    bottomLeft:
                                        Radius.circular(isSender ? 19 : 0),
                                    bottomRight:
                                        Radius.circular(isSender ? 0 : 19),
                                  )),
                              child: Text(message),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 9),
                              child: Row(
                                mainAxisAlignment: isSender
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat('hh:mm a').format(chatsdate),
                                    style: const TextStyle(
                                        fontSize: 10,
                                        color: AppColor.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  isSender
                                      ? status == 1 || status == 2
                                          ? Icon(
                                              Icons.circle,
                                              size: 5,
                                              color: status == 1
                                                  ? AppColor.black
                                                  : AppColor.primary,
                                            )
                                          : const SizedBox()
                                      : const SizedBox(),
                                  isSender
                                      ? status == 1 || status == 2
                                          ? Icon(
                                              Icons.circle,
                                              size: 5,
                                              color: status == 1
                                                  ? AppColor.black
                                                  : AppColor.primary,
                                            )
                                          : const SizedBox()
                                      : const SizedBox(),
                                  isSender
                                      ? status == 0
                                          ? const Icon(Icons.circle,
                                              size: 5, color: AppColor.black)
                                          : const SizedBox()
                                      : const SizedBox(),
                                ],
                              ),
                            )
                          ]);
                    })),
                  ],
                ),
              ),
            );
          })),
          Consumer<ChatProvider>(builder: (context, value, child) {
            return Container(
              color: Colors.transparent,
              height: 48,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      controller: value.chatEditingController,
                      textInputAction: TextInputAction.send,
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0),
                        suffixIcon: const Icon(
                          Icons.add_circle,
                          color: Colors.black,
                          size: 28,
                        ),
                        prefixIcon:  IconButton(onPressed: (){
                            value.receiveMessage(
                                  value.chatEditingController.text,
                                  int.parse(userIndex));

                        },icon:const Icon(Icons.keyboard_voice_sharp)),
                        fillColor: Colors.grey.withOpacity(0.2),
                        filled: true,
                        hintText: 'Send Your Massage',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(50)),
                    clipBehavior: Clip.hardEdge,
                    child: Material(
                      color: Colors.transparent,
                      child: Ink(
                        child: InkWell(
                            onTap: () {
                              value.sendMessage(
                                  value.chatEditingController.text,
                                  int.parse(userIndex));
                            },
                            child: Center(
                                child: Image.asset('assets/images/send.png'))),
                      ),
                    ),
                  ),
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
