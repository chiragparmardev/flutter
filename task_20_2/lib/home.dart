import 'package:flutter/material.dart';
import 'package:task_22/demoListgrid.dart';
import 'package:task_22/design_grid.dart';
import 'package:task_22/material_button.dart';
import 'package:task_22/playstore.dart';
import 'package:task_22/restaurant.dart';

import 'buttonsGradient.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ButtonsGradient()));
            }, child: const Text('button')
            ),
            OutlinedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MaterialButtonAll()));
            }, child: const Text('material Button 1')
            ),
            OutlinedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ButtonTwo()));
            }, child: const Text('material Button 2')
            ),
            OutlinedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DemoListGrid()));
            }, child: const Text('Demo List & Grid')
            ),
            OutlinedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DesignGrid()));
            }, child: const Text('Grid')
            ),
            OutlinedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Restaurant()));
            }, child: const Text('Restaurant')
            ),
            OutlinedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PlayStore()));
            }, child: const Text('Play Store')
            ),
          ],
        ),
      ),
    );
  }
}
