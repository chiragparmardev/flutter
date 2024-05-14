// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_27_03/Cutom/Appbar/appbar_custom.dart';
import 'package:task_27_03/Cutom/Button/full_button_custom.dart';
import 'package:task_27_03/Cutom/TextField/text_field_custom.dart';
import 'package:task_27_03/Utils/AppColor.dart';
import 'package:task_27_03/providers/address_provider.dart';

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({super.key});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {


  late int addressIndex;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<AdderssProvider>(context, listen: false);
      provider.getAddressIndex(context);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: uiHelper.CustomAppbar(() {
        Navigator.pop(context);
      }, 'Edit Address'),
      body: Consumer<AdderssProvider>(builder: (context, value, child) {
        return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFieldCustom(
                    controller: value.address,
                    hint: "Address",
                    focusNode: value.addressFocusNode,
                    nextFocusNode: value.unitFocusNode,
                    endIcon: Icons.location_on_sharp,
                  ),
                  TextFieldCustom(
                    controller: value.unit,
                    hint: "Enter Unit Number",
                    focusNode: value.unitFocusNode,
                    nextFocusNode: value.cityFocusNode,
                  ),
                  TextFieldCustom(
                    controller: value.city,
                    hint: "City",
                    focusNode: value.cityFocusNode,
                    nextFocusNode: value.stateFocusNode,
                  ),
                  TextFieldCustom(
                    controller: value.state,
                    hint: "State",
                    focusNode: value.stateFocusNode,
                    nextFocusNode: value.zipcodeFocusNode,
                  ),
                  TextFieldCustom(
                    controller: value.zipcode,
                    hint: "Zipcode",
                    focusNode: value.zipcodeFocusNode,
                    nextFocusNode: value.instructionFocusNode,
                  ),
                  TextFieldCustom(
                    controller: value.instruction,
                    hint: "Delivery Instruction",
                    focusNode: value.instructionFocusNode,
                    action: TextInputAction.done,
                    maxLine: 5,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CustomFullButton(
                  ontap: () async {
                    if (value.address.text.isEmpty ||
                        value.unit.text.isEmpty ||
                        value.city.text.isEmpty ||
                        value.state.text.isEmpty ||
                        value.zipcode.text.isEmpty ||
                        value.instruction.text.isEmpty) {
                      var snackBar = const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('please enter All details'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                     value.editAddress();
                      var snackBar = const SnackBar(
                          backgroundColor: AppColor.primary,
                          content: Text('Details Update'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      Navigator.pop(context);
                    }
                  },
                  title: 'Update'),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      );
      })
    );
  }
}
