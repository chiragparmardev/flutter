import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:task_27_03/Utils/AppColor.dart';

class CustomTextFieldMobile extends StatelessWidget {
  const CustomTextFieldMobile({
    super.key,
    required this.mobile,
    this.action = TextInputAction.next,
  });

  final TextEditingController mobile;
  final TextInputAction action;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: AppColor.grey),
      child: Row(
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
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
            child: Container(
              width: 1,
              color: AppColor.grey200,
            ),
          ),
          Expanded(
            child: TextFormField(
              textInputAction: action,
              autofocus: true,
              controller: mobile,
              keyboardType: TextInputType.number,
              cursorColor: AppColor.grey200,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsetsDirectional.zero,
                  hintText: 'Phone Number',
                  hintStyle: TextStyle(color: AppColor.grey200),
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          )
        ],
      ),
    );
  }
}
