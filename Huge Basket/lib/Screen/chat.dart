import 'package:flutter/material.dart';
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
            child: Consumer<ChatProvider>(
              builder: (context, value, child) {
              final chatData =
                    value.getChatDataForUserProfile(int.parse(arguments.index));
                Map<String, List<Map<String, dynamic>>> groupedMessages = {};
                for (var message in chatData) {
                  DateTime dateTime = DateTime.parse(message['timestamp']);
                  String dateKey = value.getFormattedDate(dateTime);

                  if (!groupedMessages.containsKey(dateKey)) {
                    groupedMessages[dateKey] = [];
                  }
                  groupedMessages[dateKey]!.add(message);
                }
                return SingleChildScrollView(
                  reverse: true,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Column(
                      children: groupedMessages.keys.map((dateKey) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 20),
                              child: Center(
                                child: Text(
                                  dateKey,
                                  style: const TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                      
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: groupedMessages[dateKey]!.length,
                              itemBuilder: (context, index) {
                                final message =
                                    groupedMessages[dateKey]![index]['message'];
                                final timestamp =
                                    groupedMessages[dateKey]![index]['timestamp'];
                                final status =
                                    groupedMessages[dateKey]![index]['read_status'];
                                final isSender =
                                    groupedMessages[dateKey]![index]['is_sender'];
                                return Column(
                                  crossAxisAlignment: isSender
                                      ? CrossAxisAlignment.end
                                      : CrossAxisAlignment.start,
                                  children: [
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
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 9),
                                      child: Row(
                                        mainAxisAlignment: isSender
                                            ? MainAxisAlignment.end
                                            : MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            value.getTime(timestamp),
                                            style: const TextStyle(
                                                fontSize: 10,
                                                color: AppColor.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          status == 1 || status == 2
                                              ? Icon(
                                                  Icons.circle,
                                                  size: 5,
                                                  color: status == 1
                                                      ? AppColor.black
                                                      : AppColor.primary,
                                                )
                                              : const SizedBox(),
                                          status == 1 || status == 2
                                              ? Icon(
                                                  Icons.circle,
                                                  size: 5,
                                                  color: status == 1
                                                      ? AppColor.black
                                                      : AppColor.primary,
                                                )
                                              : const SizedBox(),
                                          status == 0
                                              ? const Icon(Icons.circle,
                                                  size: 5, color: AppColor.black)
                                              : const SizedBox(),
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
          ),
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
                      prefixIcon: const Icon(Icons.keyboard_voice_sharp),
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
                    child:  Material(
                      color: Colors.transparent,
                      child: Ink(
                        child: InkWell(
                          onTap: (){
                            value.sendMessage(value.chatEditingController.text, int.parse(userIndex));
                          },
                          child: Center(child: Image.asset('assets/images/send.png'))),
                      ),
                    ),),
              ],
            ),
          );
          })
          
        ],
      ),
   
    );
  }
}
