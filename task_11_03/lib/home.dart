import 'package:flutter/material.dart';
import 'package:task_11_03/alertdialog.dart';
import 'package:task_11_03/gridandlist.dart';
import 'package:task_11_03/oceanview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AlertDialogDemo()));
                },
                child: const Text('design 1')),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GridandListPage()));
                },
                child: const Text('design 2')),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OceanView()));
                },
                child: const Text('design 3'))
          ],
        ),
      ),
    );
  }
}
