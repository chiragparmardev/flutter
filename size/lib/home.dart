import 'package:flutter/material.dart';
import 'package:size/size.dart';

class HomePgae extends StatelessWidget {
  const HomePgae({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            // height: size.h(),
            height: 0.10.ch,
            width: size.w(),
            // width: 0.10.cw,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(0.010.r),
            ),
            child: Center(
              child: Text(
                'Hello',
                style: TextStyle(fontSize: 0.05.fs),
              ),
            ),
          )
        ],
      ),
    );
  }
}


// note:- this class use a media query so all size and with apply on 0.{value} like this

// in main.dart add this line
    // size.setContext(context);


// if u want a full width
 // width: size.w(),

//  if u wnat a full height
  // height: size.h(),

// if u want a custom height/width- using media query
  // width: 0.10.cw;
  // height: 0.10.ch;

// if font size give in medai query -  using width 
  // fontSize: 0.05.fs

// if u want to give a radius
  // circular(50.r)  - if u want a full circular so wirte right this
  // circular(0.010.r)  - if i want a small circlular so wirte right this