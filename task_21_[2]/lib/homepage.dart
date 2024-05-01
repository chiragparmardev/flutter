import 'package:flutter/material.dart';
import 'package:task_21_2/chat.dart';

class HomePageTwo extends StatelessWidget {
  const HomePageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
           SizedBox(
          height: 200,
          child: Center(
            child: TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
            }, child: Text('Profile Details goes here.')),
          ),
        ),
            SizedBox(
              height: 50,
              child: AppBar(
                backgroundColor: Colors.blue,
                bottom: const TabBar(
                  indicatorWeight: 3,
                  indicatorColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.directions_bike,
                        color: Colors.white,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.directions_car,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                Container(
                  color: Colors.red,
                  child: const Center(
                      child: Text(
                        "Bike"
                      )),
                ),
                Container(
                  color: Colors.red,
                  child: const Center(
                      child: Text(
                        "car",
                      )),
                  // height: 220,
                ),
              ]),
            )
        ]
        )
      ),
    );
  }
}
