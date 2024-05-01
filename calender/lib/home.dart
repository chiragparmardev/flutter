// ignore_for_file: prefer_const_constructors, sized_box_for_redspace, unnecessary_string_interpolations, sized_box_for_whitespace

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedMonth = 1;
  int _selectedDate = 1;
  int _selectedYear = DateTime.now().year;

  final List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Calendar Date Chooser"),
      ),
      body: Column(
        children: [
          // Date Selector
          Container(
            height: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 150,
                  child: ListWheelScrollView(
                    itemExtent: 35,
                    diameterRatio: 2.5,
                    physics: FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        _selectedMonth = index + 1;
                      });
                    },
                    children: List.generate(
                      12,
                      (index) => Container(
                        child: Center(
                          child: Text(
                            "${months[index]}",
                            style: TextStyle(
                              fontSize: _selectedMonth == index + 1 ? 25 : 20,
                              fontWeight: FontWeight.bold,
                              color: _selectedMonth == index + 1
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),

                // Date Selector
                Container(
                  width: 100,
                  height: 150,
                  child: ListWheelScrollView(
                    itemExtent: 35,
                    diameterRatio: 2.5,
                    physics: FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        _selectedDate = index + 1;
                      });
                    },
                    children: List.generate(
                      31,
                      (index) => Center(
                        child: Text(
                          "${index + 1}",
                          style: TextStyle(
                            fontSize: _selectedMonth == index + 1 ? 25 : 20,
                            fontWeight: FontWeight.bold,
                            color: _selectedDate == index + 1
                                ? Colors.red
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),

                // Year Selector
                Container(
                  width: 100,
                  height: 150,
                  child: ListWheelScrollView(
                    itemExtent: 35,
                    diameterRatio: 2.5,
                    physics: FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        _selectedYear = index + DateTime.now().year;
                      });
                    },
                    children: List.generate(
                      200,
                      (index) => Center(
                        child: Text(
                          "${DateTime.now().year + index}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: _selectedMonth == index + 1 ? 25 : 20,
                            color: _selectedYear == DateTime.now().year + index
                                ? Colors.red
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Display Selected Date
          SizedBox(height: 20),
          Text(
            "Selected Date: ${months[_selectedMonth - 1]} $_selectedDate/$_selectedYear",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
