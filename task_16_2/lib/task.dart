// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_16_19/bottombar.dart';
import 'package:task_16_19/task_3.dart';
import 'package:task_16_19/task_4.dart';
import 'package:task_16_19/task_5.dart';
import 'package:task_16_19/task_6.dart';

class TaskSelectionPage extends StatefulWidget {
  const TaskSelectionPage({Key? key}) : super(key: key);

  @override
  _TaskSelectionPageState createState() => _TaskSelectionPageState();
}

class _TaskSelectionPageState extends State<TaskSelectionPage> {
  String? _selectedTask;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Select a Task',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => BottomBarCustom()));
          }, icon: Icon(Icons.more_vert,color: Colors.white,))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey)),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    isDense: false,
                    underline: SizedBox(),
                    value: _selectedTask,
                    hint: Text('Select a Task'),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedTask = newValue;
                      });
                    },
                    items: <String>[
                      'Task 3',
                      'Task 4',
                      'Task 5',
                      'Task 6',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_selectedTask != null) {
                    switch (_selectedTask) {
                      case 'Task 3':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppbarsWidget()),
                        );
                        break;
                      case 'Task 4':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RowColumFlex()),
                        );
                        break;
                      case 'Task 5':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomRowColum()),
                        );
                        break;
                      case 'Task 6':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListAllPage()),
                        );
                        break;
                      default:
                        break;
                    }
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
