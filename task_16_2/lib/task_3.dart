// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';

class AppbarsWidget extends StatelessWidget {
  const AppbarsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text(
                  "Report",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
            offset: Offset(0, 50),
            color: Colors.grey[900],
            elevation: 2,
          ),
        ],
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AppbarFirst()));
                },
                child: const Text("Appbars 1")),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              clipBehavior: Clip.hardEdge,
              child: Material(
                color: Colors.transparent,
                child: Ink(
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AppbarSecond()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Appbars 2',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AppbarThird()));
                },
                child: const Text("Appbars 3")),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AppbarFour()));
                },
                child: const Text("Appbars 4")),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AppbarFive()));
                },
                child: const Text("Appbars 5")),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AppbarSix()));
                },
                child: const Text("Appbars 6")),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.panorama_photosphere)),
          ])),
    );
  }
}

class AppbarFirst extends StatelessWidget {
  const AppbarFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Without back button & actions'),
        ),
        floatingActionButton: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 14, 192, 189),
            onPressed: () {},
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ));
  }
}

class AppbarSecond extends StatelessWidget {
  const AppbarSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Center Title'),
          centerTitle: true,
        ),
        floatingActionButton: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: FloatingActionButton(
              backgroundColor: Color.fromARGB(255, 104, 58, 203),
              onPressed: () {},
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              )),
        ));
  }
}

class AppbarThird extends StatelessWidget {
  const AppbarThird({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('With Single action'),
        ),
        floatingActionButton: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black),
              borderRadius: BorderRadius.circular(50)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: () {},
                  child: Icon(
                    Icons.warning,
                    color: Colors.white,
                  ))),
        ));
  }
}

class AppbarFour extends StatelessWidget {
  const AppbarFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('With back button'),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.yellow[700],
            onPressed: () {},
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            )));
  }
}

class AppbarFive extends StatelessWidget {
  const AppbarFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search toolBar'),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        floatingActionButton: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: FloatingActionButton.extended(
            backgroundColor: Colors.green[700],
            onPressed: () {},
            label: Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ));
  }
}

class AppbarSix extends StatelessWidget {
  const AppbarSix({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Page Title'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.share),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.orange[700],
          onPressed: () {},
          label: Text(
            'Take pic',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(
            Icons.camera_enhance,
            color: Colors.white,
          ),
        ));
  }
}
