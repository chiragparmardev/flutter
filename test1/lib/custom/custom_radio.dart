import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomRadio extends StatelessWidget {
  const CustomRadio({
    super.key,
    required this.onSelect,
    required this.index,
    required this.svgicon,
  });

  final Function(int p1) onSelect;
  final int index;
  final String svgicon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelect(index);
      },
      child: SvgPicture.asset(
        svgicon,
        width: 20.h,
        height: 20.h,
      ),
    );
  }
}
