import 'package:flutter/material.dart';
import 'package:p1/count.dart';
import 'package:p1/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Opacity"),
        centerTitle:  true,
       leading: IconButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const CountPage()));
       }, icon: const Icon(Icons.numbers)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<HomeProvider>(builder: (context, value, chilld){
            return   Center(child: Image.asset('assets/images/logo.png',width: 200,height:200,
              opacity:  AlwaysStoppedAnimation(value.value)
            ),
          );
          }),    
          Consumer<HomeProvider>(builder: (context, value, chilld){
            return Slider(value: value.value, min: 0.0, max: 1.0, onChanged: (val){
              value.setValue(val);
            });
          }),
        ],
      ),
    );
  }
}