import 'package:flutter/material.dart';

class CountProvider with ChangeNotifier{
  int count = 0;

  void increaseCount(){
    count++;
    notifyListeners();
  }

  void decreaseCount() {
    count--;
    notifyListeners();
  }
}