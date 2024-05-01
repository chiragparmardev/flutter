import 'package:flutter/material.dart';
import 'package:test_2/AppColor.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final int? maxline;
  final TextEditingController controller;
  final Function? ontap;

  final TextInputAction? textInputAction;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.label,
      this.textInputAction,
      this.maxline,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        onTap: () {
          ontap == null ? null : ontap!();
        },
        controller: controller,
        textInputAction: textInputAction ?? TextInputAction.next,
        maxLines: maxline ?? 1,
        cursorColor: AppColor.textGrey,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: label,
          labelText: label,
          labelStyle: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: AppColor.textGrey),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.textGrey),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.textGrey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.textGrey),
          ),
        ),
      ),
    );
  }
}
