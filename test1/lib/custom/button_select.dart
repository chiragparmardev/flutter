import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test1/Utils/AppColor.dart';

class ButtonOneSelect extends StatelessWidget {
  final String text;
  final int index;
  final bool isSelected;
  final String? icon;
  final Function(int) onSelect;
  const ButtonOneSelect({
    super.key,
    required this.text,
    required this.index,
    required this.isSelected,
    required this.onSelect,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonColor = isSelected ? AppColor.yellow : AppColor.fontgrey;
    Color textColor = isSelected ? AppColor.yellow : AppColor.fontgrey;
    return Container(
      // height: 32.h,
      decoration: BoxDecoration(
          color: AppColor.black,
          border: Border.all(color: buttonColor),
          borderRadius: BorderRadius.circular(40.r)),
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            onTap: () {
              onSelect(index);
            },
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 12.w, right: 12.w, top: 6.h, bottom: 6.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    icon != null
                        ? SvgPicture.asset(
                            icon!,
                            color: textColor,
                          )
                        : Container(),
                    SizedBox(
                      width: icon != null ? 5.w : 0,
                    ),
                    Text(
                      text,
                      style: TextStyle(
                          color: textColor,
                          fontFamily: 'mont',
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
