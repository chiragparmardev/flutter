// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_19/DesignEight.dart';
import 'package:task_19/DesignFIve.dart';
import 'package:task_19/DesignFirst.dart';
import 'package:task_19/DesignFour.dart';
import 'package:task_19/DesignSeven.dart';
import 'package:task_19/DesignSix.dart';
import 'package:task_19/DesignThree.dart';
import 'package:task_19/DesignTwo.dart';

class TaskSelect extends StatefulWidget {
  const TaskSelect({super.key});

  @override
  State<TaskSelect> createState() => _TaskSelectState();
}

class _TaskSelectState extends State<TaskSelect> {
  String? _selectedTask;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Select a Task',
          style: TextStyle(color: Colors.white),
        ),
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
                      'Design 1',
                      'Design 2',
                      'Design 3',
                      'Design 4',
                      'Design 5',
                      'Design 6',
                      'Design 7',
                      'Design 8',
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
                      case 'Design 1':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DesignFirst()),
                        );
                        break;
                      case 'Design 2':
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DesignTwo()),
                        );
                        break;
                      case 'Design 3':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DesignThree()),
                        );
                        break;
                      case 'Design 4':
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DesignFour()),
                        );
                        break;
                      case 'Design 5':
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DesignFive()),
                        );
                        break;
                      case 'Design 6':
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DesignSix()),
                        );
                        break;
                      case 'Design 7':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DesignSeven()),
                        );
                        break;
                      case 'Design 8':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DesignEight()),
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
