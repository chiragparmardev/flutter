import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:test1/Utils/AppColor.dart';

class OptionMenu extends StatefulWidget {
  final String label;
  final bool isActive;
  final Function(bool) onChanged;
  const OptionMenu(
      {super.key,
      required this.label,
      required this.isActive,
      required this.onChanged});

  @override
  State<OptionMenu> createState() => _OptionMenuState();
}

class _OptionMenuState extends State<OptionMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: GestureDetector(
        onTap: () {
          widget.onChanged(!widget.isActive);
        },
        child: Container(
          decoration: BoxDecoration(
            border: GradientBoxBorder(
                width: 0.5,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: widget.isActive
                        ? [Colors.transparent, Colors.transparent]
                        : [AppColor.white, AppColor.whiteLight])),
            borderRadius: BorderRadius.circular(50.w),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: widget.isActive
                  ? [AppColor.greenDark, AppColor.greenLight]
                  : [AppColor.black, AppColor.blackLight],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 6.h,
            ),
            child: Center(
              child: Text(
                widget.label,
                style: TextStyle(
                  color: widget.isActive ? AppColor.black : AppColor.white,
                  fontFamily: 'mont',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
