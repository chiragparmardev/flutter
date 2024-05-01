// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class GridandListPage extends StatelessWidget {
  const GridandListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Scaffold(
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  const SliverAppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.blue,
                    floating: true,
                    snap: true,
                    title: Text(
                      'Flutter Demo Home Page',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ];
              },
              body: Column(
                children: [
                  Container(
                    color: Colors.blue,
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 4,
                      indicatorColor: Colors.white,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey.shade400,
                      tabs: const [
                        Tab(
                          text: "Page 1",
                        ),
                        Tab(
                          text: "Page 2",
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      ListView.builder(
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.white,
                              elevation: 1,
                              child: ListTile(
                                title: Text("List Item : ${index + 1}"),
                              ),
                            );
                          },
                          itemCount: 20),
                      ListView.builder(
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.white,
                              elevation: 1,
                              child: ListTile(
                                title: Text("List Item : ${index + 1}"),
                              ),
                            );
                          },
                          itemCount: 20),
                    ]),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
