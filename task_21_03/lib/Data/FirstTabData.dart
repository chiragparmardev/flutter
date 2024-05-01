import 'package:flutter/material.dart';
import 'package:task_21_03/AppColor.dart';

class Items {
  final IconData icon;
  final String title;
  final String centerFirstTitle;
  final String centerSecondTitle;
  final String bottomFirstText;
  final String bottomSecondText;
  final Color color;

  Items(this.icon, this.title, this.color, this.bottomFirstText,
      this.bottomSecondText, this.centerFirstTitle, this.centerSecondTitle);
}

List<Items> item = <Items>[
  Items(Icons.heart_broken, "Heart rate", AppColor.pink, "80-100", "Healthy",
      "124", "bpm"),
  Items(Icons.nights_stay_rounded, "Sleep", AppColor.purple, "Deep Sleep",
      "5 h 13 m", "8", "h 42 m"),
  Items(Icons.fire_extinguisher, "Energy Burn", AppColor.orange, "Daily Goal",
      "900 kcal", "583", "kcal"),
  Items(Icons.directions_walk_rounded, "Steps", AppColor.lightBlue,
      "Daily Goal", "20,000 Steps", "16,741", ""),
  Items(Icons.roundabout_right_sharp, "Running", AppColor.blue, "Daily Goal",
      "10 km", "5,3", "km"),
  Items(Icons.pedal_bike_outlined, "Cycling", AppColor.green, "Daily Goal",
      "20 km", "12,5", "km"),
];
