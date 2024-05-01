import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test1/Utils/AppColor.dart';
import 'package:test1/custom/profile_details.dart';
import 'package:test1/screen/coaching.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.black,
        title: const Image(image: AssetImage('assets/images/appbar_logo.png')),
        actions: [
          SvgPicture.asset('assets/svgs/calendar.svg'),
          SizedBox(
            width: 12.w,
          ),
          SvgPicture.asset('assets/svgs/chat.svg'),
          SizedBox(
            width: 12.w,
          ),
          SvgPicture.asset('assets/svgs/bell.svg'),
          SizedBox(
            width: 17.w,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(
              thickness: 0.5,
              color: AppColor.borderGrey,
            ),
            const ProfileDetails(),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    Container(
                      color: AppColor.black,
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorWeight: 2.0,
                        dividerHeight: 2.0,
                        labelStyle: const TextStyle(
                            fontFamily: 'mont',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColor.yellow),
                        unselectedLabelStyle: const TextStyle(
                            fontFamily: 'mont',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColor.fontgrey),
                        indicatorColor: AppColor.yellow,
                        controller: tabController,
                        tabs: const [
                          Tab(
                            text: "Coaching",
                          ),
                          Tab(
                            text: "Posts",
                          ),
                          Tab(
                            text: "About",
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2.0,
                      child: TabBarView(
                        physics: AlwaysScrollableScrollPhysics(),
                        controller: tabController,
                        children: const [
                          Coaching(),
                          Center(
                              child: Text(
                            'Posts',
                            style: TextStyle(color: AppColor.white),
                          )),
                          Center(
                              child: Text(
                            'About',
                            style: TextStyle(color: AppColor.white),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
