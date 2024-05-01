import 'package:flutter/material.dart';
import 'package:task_22_03/basic_page.dart';
import 'package:task_22_03/setting.dart';
import 'package:task_22_03/ties_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController controller = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            'Staggared GridView',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Tabbar(
              controller: controller,
            ),
            Expanded(
              child: TabBarView(
                  controller: controller,
                  children: const [BasicPage(), Tiespage(), SettingPage()]),
            )
          ],
        ),
      ),
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
    return TabBar(
        labelPadding: const EdgeInsets.symmetric(horizontal: 0),
        controller: widget.controller,
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        labelStyle: const TextStyle(color: Colors.white),
        tabs: [
          tabview('basic', 0, Icons.home),
          tabview('Dynamic Ties', 1, Icons.title_sharp),
          tabview('Silver', 2, Icons.settings),
        ]);
  }

  Widget tabview(String label, int index, IconData icon) {
    return Tab(
      icon: Icon(icon),
      text: label,
    );
  }
}
