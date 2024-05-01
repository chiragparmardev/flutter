import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_2_03/Utility/AppColor.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String hinttext;
  final String? labeltext;
  final IconData icon;
  final TextInputType textInputType;
  final TextEditingController controller;
  final tenFalse;
  final secondTextField;
  final bool isSecondTextField;

  final FormFieldValidator? validator;

  const TextFormFieldCustom(
      {Key? key,
      required this.hinttext,
      this.labeltext,
      required this.icon,
      this.textInputType = TextInputType.text,
      required this.controller,
      this.tenFalse,
      this.secondTextField,
      this.validator,
      required this.isSecondTextField})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      inputFormatters: [
        if (textInputType == TextInputType.number && tenFalse == null)
          LengthLimitingTextInputFormatter(10)
      ],
      decoration: InputDecoration(
          contentPadding: isSecondTextField ? EdgeInsets.all(20) : null,
          fillColor: isSecondTextField ? AppColor.secondaryLight : null,
          filled: isSecondTextField ? true : false,
          prefixIcon: isSecondTextField
              ? Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Icon(
                    icon,
                    color: AppColor.grey,
                    size: 25,
                  ),
                )
              : Icon(
                  icon,
                  color: AppColor.grey,
                ),
          hintText: hinttext,
          hintStyle: isSecondTextField
              ? TextStyle(fontSize: 20, color: AppColor.grey)
              : TextStyle(color: AppColor.grey, fontSize: 17),
          labelStyle: isSecondTextField
              ? null
              : TextStyle(fontSize: 17, color: AppColor.grey),
          labelText: isSecondTextField ? null : labeltext,
          floatingLabelStyle: isSecondTextField
              ? TextStyle(color: AppColor.grey, fontSize: 17)
              : TextStyle(color: AppColor.grey, fontSize: 17),
          border: isSecondTextField
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none)
              : const OutlineInputBorder(),
          focusedBorder: isSecondTextField
              ? null
              : OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primary, width: 2.0))),
      validator: validator,
    );
  }
}
