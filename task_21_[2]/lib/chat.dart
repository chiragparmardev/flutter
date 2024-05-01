import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        title: Text('Tab bar',style: TextStyle(color: Colors.white),),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: AppBar(
              bottom:  TabBar(
                labelColor: Colors.white,
                unselectedLabelColor : Colors.pinkAccent,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                indicator: BoxDecoration(

                  borderRadius: BorderRadius.circular(20),
                  color: Colors.pinkAccent
                ),
                tabs: [
                 Container(
                    width: 100,
                   height: 40,
                   decoration: BoxDecoration(
                     color: Colors.transparent,
                     borderRadius: BorderRadius.circular(40),
                     border: Border.all(
                       width: 2,
                       color: Colors.pinkAccent
                     )
                   ),
                   child: Center(child: Text('Chat')),
                 ),
                  Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                            width: 2,
                            color: Colors.pinkAccent
                        )
                    ),
                    child: Center(child: Text('Status')),
                  ),

                  Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                            width: 2,
                            color: Colors.pinkAccent
                        )
                    ),
                    child: Center(child: Text('Call')),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(children: [
              ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, index) {
                  return  ListTile(
                  title: Text('call list $index'),
                  subtitle: Text('Tab bar ui'),
                  trailing: Icon(Icons.arrow_circle_right),
                  );
                }
              ),
              const Center(
                  child: Text(
                    "Status",
                  )),
              const Center(
                  child: Text(
                    "Call",
                  )),
            ]),
          )
        ],
      ),
    ));
  }
}
