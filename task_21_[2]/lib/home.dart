import 'package:flutter/material.dart';

class HomePage extends StatefulWidget  {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.grey,
        title: const Text('My Profile',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
        ),
      ),
      drawer: const Drawer(),
      body: Column(
        children: [
          const SizedBox(
            height: 200,
            child: Center(
              child: Text('Profile Details goes here.'),
            ),
          ),
           DefaultTabController(
            length: 2, // Number of tabs
            child: Expanded(
              child: Column(
                children: [
                  Container(
                    color: Colors.blue,
                    child:  TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 3.0,
                      indicatorColor: Colors.white,
                      controller: tabController,
                      tabs: [
                        Tab(icon: Icon(Icons.directions_bike,color: Colors.white,),),
                        Tab(icon: Icon(Icons.car_crash,color: Colors.white,),)
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        Container(
                            color: Colors.red,
                            child: Center(child: Text('Bike'))),
                        Container(
                            color: Colors.yellow,
                            child: Center(child: Text('Bus'))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
