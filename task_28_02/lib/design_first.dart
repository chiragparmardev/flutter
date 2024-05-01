import 'package:flutter/material.dart';

class DesignFirst extends StatelessWidget {
  const DesignFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Wrap(
              spacing: 5,
              runSpacing: 5,
              direction: Axis.horizontal,
              children: List.generate(
                  7,
                  (index) => Container(
                        width: 80,
                        height: 80,
                        color: Colors.red,
                        child: const Center(
                          child: Text(
                            'Woolha',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ))),
        ),
      ),
    );
  }
}
