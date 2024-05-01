import 'package:flutter/material.dart';
import 'package:task_27_03/Utils/AppColor.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.mobile,
    required this.hint,
    this.action = TextInputAction.next,
  });

  final TextEditingController mobile;
  final String hint;
  final TextInputAction action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: AppColor.grey),
        child: TextFormField(
          textInputAction: action,
          autofocus: true,
          controller: mobile,
          keyboardType: TextInputType.number,
          cursorColor: AppColor.grey200,
          decoration: InputDecoration(
              contentPadding: const EdgeInsetsDirectional.only(start: 20),
              hintText: hint,
              hintStyle: const TextStyle(color: AppColor.grey200),
              border: const OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}
