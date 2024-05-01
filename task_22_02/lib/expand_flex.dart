// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ExpandFlexPage extends StatelessWidget {
  const ExpandFlexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                color: Colors.blue,
                child: Center(
                  child: Container(
                    color: Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Expanded',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                ),
              )),
              Flexible(
              fit: FlexFit.loose,
                  child: Container(
                    padding: EdgeInsets.all(15),
                color: Colors.purple,
                child: Container(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Flexible',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              ))
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                height: 150,
                color: Colors.blue,
                child: Center(
                  child: Container(
                    color: Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Expanded',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                ),
              )),
              Expanded(
                  child: Container(
                height: 150,
                color: const Color.fromARGB(255, 0, 25, 46),
                child: Center(
                  child: Container(
                    color: Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Expanded',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                ),
              )),
            ],
          ),
          Row(
            children: [
              Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.purple,
                    child: Container(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Flexible',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  )),
              Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.purple,
                    child: Container(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Flexible',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
          Row(
            children: [
              Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.purple,
                    child: Container(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Flexible',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  )),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15),
                color: const Color.fromARGB(255, 0, 25, 46),
                child: Center(
                  child: Container(
                    color: Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Expanded',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                ),
              )),
            ],
          )
        ],
      ),
    );
  }
}
