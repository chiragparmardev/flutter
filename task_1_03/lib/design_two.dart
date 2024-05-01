import 'package:flutter/material.dart';
import 'package:task_1_03/AppColor.dart';

class DesignTwo extends StatefulWidget {
  const DesignTwo({super.key});

  @override
  State<DesignTwo> createState() => _DesignTwoState();
}

class _DesignTwoState extends State<DesignTwo> {
  bool visible = true;
  Color buttonColor = AppColor.buttonColor;
  Color hideButtonColor = AppColor.buttonColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: visible,
                child: Image.asset(
                  'assets/images/bird.png',
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              customButton('Shaw Logo', () {
                setState(() {
                  visible = true;
                  buttonColor = AppColor.buttonColor;
                });
              }, buttonColor),
              const SizedBox(
                height: 15,
              ),
              customButton('Hide Logo', () {
                setState(() {
                  visible = false;
                  buttonColor = AppColor.grey;
                });
              }, hideButtonColor)
            ],
          ),
        ),
      ),
    );
  }

  Container customButton(String title, Function ontap, Color color) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(50)),
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            onTap: () {
              ontap();
            },
            child: Center(
              child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
