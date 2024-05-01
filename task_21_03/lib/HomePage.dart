import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_21_03/AppColor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_21_03/FirstTab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;

  late final TabController controller = TabController(length: 3, vsync: this);

  void ontap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              top: 10.h,
              bottom: 10.h,
            ),
            child: Container(
              height: 10.w,
              width: 10.w,
              decoration: BoxDecoration(
                  color: AppColor.whiteBlue,
                  borderRadius: BorderRadius.circular(50.r)),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 20.sp,
                  color: AppColor.darkblue,
                ),
              ),
            ),
          ),
          title: Text(
            'STATS',
            style: TextStyle(
                color: AppColor.darkblue,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
        bottomNavigationBar: bottomBar(),
        body: Column(
          children: [
            Tabbar(
              controller: controller,
            ),
            Expanded(
              child: TabBarView(controller: controller, children: const [
                FirstTab(),
                Center(child: Text('Week')),
                Center(child: Text('month')),
              ]),
            )
          ],
        ),
      ),
    );
  }

  BottomNavigationBar bottomBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.helmetUn),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.dumbbell),
          label: 'Stats',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.medal),
          label: 'Rewards',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.bullseye),
          label: 'Goals',
        ),
      ],
      currentIndex: selectedIndex,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.grey.shade500,
      selectedItemColor: AppColor.darkblue,
      onTap: ontap,
    );
  }
}

class Tabbar extends StatefulWidget {
  const Tabbar({super.key, required this.controller, s});
  final TabController controller;
  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> with SingleTickerProviderStateMixin {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        selectedIndex = widget.controller.index;
      });
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20.h,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.r),
          color: Colors.grey.shade200),
      // height: 45.h,
      child: TabBar(
          labelPadding: EdgeInsets.symmetric(horizontal: 0.w),
          controller: widget.controller,
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          unselectedLabelColor: AppColor.blackLight,
          labelStyle: const TextStyle(color: AppColor.white),
          tabs: [
            tabview('Day', 0),
            tabview('Week', 1),
            tabview('Month', 2),
          ]),
    );
  }

  Widget tabview(String label, int index) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          color: selectedIndex == index
              ? AppColor.darkblue
              : Colors.grey.shade200),
      width: double.infinity / 3,
      child: Tab(
        text: label,
      ),
    );
  }
}
