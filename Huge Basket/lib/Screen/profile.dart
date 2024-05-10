// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_27_03/Utils/AppColor.dart';
import 'package:task_27_03/route_setting.dart';

class Profile {
  final Icon icon;
  final String title;
  final Function ontap;
  final BuildContext context;

  Profile(
      {required this.icon,
      required this.title,
      required this.ontap,
      required this.context});
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late List<Profile> profileList;

  @override
  void initState() {
    super.initState();
    profileList = [
      Profile(
          icon: const Icon(Icons.location_on_outlined),
          title: 'Manage Address',
          ontap: () {
            Navigator.pushNamed(context, MyRouter.manage_address);
          },
          context: context),
      Profile(
          icon: const Icon(Icons.chat_bubble_outline),
          title: 'Recent Chat',
          ontap: () {
               Navigator.pushNamed(context, MyRouter.recent_chat);
          },
          context: context),
      Profile(
          icon: const Icon(Icons.notifications_none),
          title: 'Notification',
          ontap: () {
            Navigator.pushNamed(context, MyRouter.notifications);
          },
          context: context),
      Profile(
          icon: const Icon(Icons.star_border),
          title: 'Rate the App',
          ontap: () {
            print('Rate the App tapped');
          },
          context: context),
      Profile(
          icon: const Icon(Icons.share_outlined),
          title: 'Share App',
          ontap: () {
            print('Share App tapped');
          },
          context: context),
      Profile(
          icon: const Icon(Icons.info_outline),
          title: 'Help & FAQ',
          ontap: () {
            print('Help & FAQ tapped');
          },
          context: context),
      Profile(
          icon: const Icon(Icons.person_2_outlined),
          title: 'About Us',
          ontap: () {
            print('About Us tapped');
          },
          context: context),
      Profile(
          icon: const Icon(Icons.insert_drive_file_outlined),
          title: 'Terms and conditions',
          ontap: () {
            print('Terms and conditions tapped');
          },
          context: context),
      Profile(
          icon: const Icon(Icons.policy_outlined),
          title: 'Privacy Policy',
          ontap: () {
            print('Privacy Policy tapped');
          },
          context: context),
      Profile(
          icon: const Icon(Icons.perm_contact_cal_outlined),
          title: 'Contact Us',
          ontap: () {
            print('Contact Us tapped');
          },
          context: context),
      Profile(
          icon: const Icon(Icons.logout),
          title: 'Logout',
          ontap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.remove('token');
            await prefs.remove('businessName');
            await prefs.remove('firstname');
            await prefs.remove('lastName');
            await prefs.remove('email');
            await prefs.remove('phone');
            await prefs.remove('zipcode');

            Navigator.pushNamedAndRemoveUntil(
                context, MyRouter.mobile_login, (route) => false);
          },
          context: context),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount;

    crossAxisCount = screenWidth < 500
        ? 2
        : screenWidth < 700
            ? 3
            : screenWidth < 900
                ? 4
                : 5;
    return Scaffold(
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
            // leading: IconButton(
            //     onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new)),
            centerTitle: true,
            title: const Text(
              'Walmart',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primary),
            ),
            actions: [
              Stack(children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRouter.edit_profile);
                    },
                    icon: const Icon(
                      Icons.edit_outlined,
                      color: AppColor.black,
                    )),
              ]),
            ],
          ),
        ),
      ),
      body: GridView.builder(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 75),
        itemCount: profileList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.3),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              profileList[index].ontap();
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.black.withOpacity(0.1),
                        blurRadius: 5,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        profileList[index].icon.icon,
                        color: AppColor.primary,
                        size: 40,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        profileList[index].title,
                        style: const TextStyle(
                            color: AppColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
