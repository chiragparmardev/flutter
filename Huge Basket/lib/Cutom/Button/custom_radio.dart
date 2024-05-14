import 'package:flutter/material.dart';
import 'package:task_27_03/Utils/AppColor.dart';

class CustomRadioAddress extends StatelessWidget {
  const CustomRadioAddress({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: 18,
      decoration: BoxDecoration(
        color: isSelected ? AppColor.primary : AppColor.grey200,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Container(
          height: 6,
          width: 6,
          decoration: BoxDecoration(
            color: isSelected ? AppColor.white : AppColor.grey,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
