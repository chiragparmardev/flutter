import 'package:flutter/material.dart';

class DemoListGrid extends StatelessWidget {
  const DemoListGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
      appBar: AppBar(
      automaticallyImplyLeading: false,
      title: const Text(
          'Demo',
          style: TextStyle(fontSize: 20)),
      bottom: const TabBar(
        indicatorColor: Colors.blue,
        tabs: [
          Tab(
            text: 'ListView',
          ),
          Tab(text: 'Gridview'),
        ],
      ),
    ),
    body:  Padding(

    padding: EdgeInsets.only(left: 10, right: 15,top: 15),
    child: TabBarView(
    children: [
      ListView.builder(
          itemCount: 5,itemBuilder:(BuildContext context, int index){
            return Card(
              child: ListTile(
                tileColor: Colors.white,
                title: Text("This is title is $index"),
                subtitle: Text("This is a list of $index number. please click on this index and navigate other page"),
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadiusDirectional.circular(50)
                  ),
                  child: Center(child: Text(index.toString(),style: const TextStyle(fontSize: 18,color: Colors.white),)),
                ),
              ),
            );
    }),
      GridView.builder(gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.3
      ),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index){
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("This is a title $index",style: const TextStyle(fontSize: 18),),
                    Text("This is a list of $index number. please click on this index and navigate other page",style: const TextStyle(fontSize: 15,color: Colors.grey),),
                  ],
                ),
              ),
            );
          } ),
    ])
    )
      )
    );
  }
}
