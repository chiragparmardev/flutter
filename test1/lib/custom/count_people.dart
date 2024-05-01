// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/Utils/AppColor.dart';

class CountPeople extends StatefulWidget {
  final int index;
  final int selectedPeopleIndex;
  final Function(int index) onSelectionChange;

  const CountPeople({
    super.key,
    required this.index,
    required this.selectedPeopleIndex,
    required this.onSelectionChange,
  });

  @override
  State<CountPeople> createState() => _CountPeopleState();
}

class _CountPeopleState extends State<CountPeople> {
  @override
  Widget build(BuildContext context) {
    final isSelected = widget.index == widget.selectedPeopleIndex;
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: InkWell(
        onTap: () {
          if (widget.onSelectionChange != null) {
            widget.onSelectionChange(widget.index);
          }
        },
        child: Container(
          width: 28.h,
          height: 28.h,
          decoration: BoxDecoration(
              color: isSelected ? Colors.yellow : Colors.transparent,
              border: Border.all(color: AppColor.fontgrey, width: 1),
              borderRadius: BorderRadius.circular(50.r)),
          child: Center(
            child: Text(
              '${widget.index + 1}',
              style: TextStyle(
                  color: isSelected ? Colors.black : AppColor.fontgrey),
            ),
          ),
        ),
      ),
    );
  }
}
