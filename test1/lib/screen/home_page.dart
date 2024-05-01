import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test1/Utils/AppColor.dart';
import 'package:test1/custom/home_card.dart';
import 'package:test1/custom/option_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, bool?> options = {
    'All': true,
    'Short Term': false,
    'Medium Term': false,
    'Long Term': false,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        backgroundColor: AppColor.black,
        centerTitle: true,
        title: const Text(
          'Live Signals',
          style: TextStyle(
              color: AppColor.white,
              fontFamily: 'mont',
              fontWeight: FontWeight.w600),
        ),
        actions: [
          SizedBox(
            width: 24.w,
            height: 24.h,
            child: SvgPicture.asset(
              'assets/svgs/search-normal.svg',
            ),
          ),
          SizedBox(
            width: 24.w,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.0.w),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: options.keys.map((option) {
                    return OptionMenu(
                      label: option,
                      isActive: options[option] ?? false,
                      onChanged: (isActive) {
                        setState(() {
                          options.forEach((key, value) {
                            options[key] = key == option ? true : false;
                          });
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Column(
                children: List.generate(3, (index) => const HomeCard()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
