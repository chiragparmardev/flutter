import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:task_27_03/Utils/AppColor.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom(
      {super.key,
      required this.controller,
      required this.hint,
      this.action = TextInputAction.next,
      this.keyboard = TextInputType.text,
      this.focusNode,
      this.nextFocusNode,
      this.endIcon,
      this.maxLine});

  final TextEditingController controller;
  final String hint;
  final TextInputAction action;
  final TextInputType keyboard;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final IconData? endIcon;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        cursorColor: AppColor.grey500,
        controller: controller,
        textInputAction: action,
        autofocus: true,
        maxLines: maxLine,
        focusNode: focusNode,
        keyboardType: keyboard,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsetsDirectional.symmetric(
              vertical: 10, horizontal: 20),
          fillColor: AppColor.grey,
          filled: true,
          suffixIcon: Icon(
            endIcon,
            color: AppColor.grey200,
            size: 20,
          ),
          prefixIcon: keyboard == TextInputType.phone
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CountryCodePicker(
                      padding: EdgeInsets.all(0),
                      onChanged: print,
                      showFlag: false,
                      showFlagDialog: true,
                      initialSelection: 'IN',
                      favorite: ['+91', '+1'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                    Container(
                      height: 23,
                      width: 1,
                      color: Colors.black.withOpacity(.5),
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                )
              : null,
          hintText: hint,
          hintStyle: const TextStyle(color: AppColor.grey200),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(23),
          ),
        ),
      ),
    );
  }
}
