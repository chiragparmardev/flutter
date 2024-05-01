// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_22_02/expand_flex.dart';
import 'package:task_22_02/mountain.dart';

class ScreenOrientation extends StatelessWidget {
  const ScreenOrientation({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExpandFlexPage()));
                },
                icon: Icon(Icons.menu_open_outlined)),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MountainPage()));
                },
                icon: Icon(Icons.more_vert))
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(0),
                  children: const [
                    DrawerHeader(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvdjEwMTYtYy0wOF8xLWtzaDZtemEzLmpwZw.jpg'),
                                fit: BoxFit.cover)),
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Chirag Parmar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ))),
                    ListTile(
                      leading: Icon(Icons.contact_page),
                      title: Text('Contacts'),
                    ),
                    ListTile(
                      leading: Icon(Icons.event),
                      title: Text('Events'),
                    ),
                    ListTile(
                      leading: Icon(Icons.note),
                      title: Text('Notes'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.stairs),
                      title: Text('Steps'),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Authors'),
                    ),
                    ListTile(
                      leading: Icon(Icons.document_scanner),
                      title: Text('Flutter Documentation'),
                    ),
                    ListTile(
                      leading: Icon(Icons.star),
                      title: Text('Usefull Links'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.bug_report),
                      title: Text('Report & issue'),
                    ),

                  ],
                ),
              ),
              
              Container(
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('hello')),
              )
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                'Coffie Feed',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(child: screenWidth > 500 ? tab() : mobile()),
            )),
          ],
        ));
  }
}

ListView tab() {
  return ListView(
      children: List.generate(4, (index) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://media.istockphoto.com/id/1356118511/photo/smart-city-and-abstract-dot-point-connect-with-gradient-line.jpg?s=612x612&w=0&k=20&c=GJldTyxDEt0GodKxGONHz9PrN9QcQQAGKONUM0vBvYc='),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://media.istockphoto.com/id/1356118511/photo/smart-city-and-abstract-dot-point-connect-with-gradient-line.jpg?s=612x612&w=0&k=20&c=GJldTyxDEt0GodKxGONHz9PrN9QcQQAGKONUM0vBvYc='),
                            fit: BoxFit.cover)),
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }));
}

ListView mobile() {
  return ListView(
      children: List.generate(4, (index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                  image: NetworkImage(
                      'https://media.istockphoto.com/id/1356118511/photo/smart-city-and-abstract-dot-point-connect-with-gradient-line.jpg?s=612x612&w=0&k=20&c=GJldTyxDEt0GodKxGONHz9PrN9QcQQAGKONUM0vBvYc='),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10)),
        ),
        SizedBox(
          height: 5,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://media.istockphoto.com/id/1356118511/photo/smart-city-and-abstract-dot-point-connect-with-gradient-line.jpg?s=612x612&w=0&k=20&c=GJldTyxDEt0GodKxGONHz9PrN9QcQQAGKONUM0vBvYc='),
                      fit: BoxFit.cover)),
            );
          },
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }));
}
