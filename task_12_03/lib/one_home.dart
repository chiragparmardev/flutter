import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_12_03/AssetsColor.dart';

class OnrHome extends StatelessWidget {
  const OnrHome({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      // statusBarColor: AssetsColor.primary,
    ));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AssetsColor.primary,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )),
          title: const Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Home Screen'),
        ),
      ),
    );
  }
}
