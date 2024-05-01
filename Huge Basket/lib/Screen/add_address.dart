// ignore_for_file: await_only_futures, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_27_03/Cutom/Appbar/appbar_custom.dart';
import 'package:task_27_03/Cutom/Button/full_button_custom.dart';
import 'package:task_27_03/Cutom/TextField/text_field_custom.dart';
import 'package:task_27_03/Utils/AppColor.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  TextEditingController address = TextEditingController();
  TextEditingController unit = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController zipcode = TextEditingController();
  TextEditingController instruction = TextEditingController();

  final FocusNode addressFocusNode = FocusNode();
  final FocusNode unitFocusNode = FocusNode();
  final FocusNode cityFocusNode = FocusNode();
  final FocusNode stateFocusNode = FocusNode();
  final FocusNode zipcodeFocusNode = FocusNode();
  final FocusNode instructionFocusNode = FocusNode();

  @override
  void dispose() {
    addressFocusNode.dispose();
    unitFocusNode.dispose();
    cityFocusNode.dispose();
    stateFocusNode.dispose();
    zipcodeFocusNode.dispose();
    instructionFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: uiHelper.CustomAppbar(() {
        Navigator.pop(context);
      }, 'Add New Address'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFieldCustom(
                    controller: address,
                    hint: "Address",
                    focusNode: addressFocusNode,
                    nextFocusNode: unitFocusNode,
                    endIcon: Icons.location_on_sharp,
                  ),
                  TextFieldCustom(
                    controller: unit,
                    hint: "Enter Unit Number",
                    focusNode: unitFocusNode,
                    nextFocusNode: cityFocusNode,
                  ),
                  TextFieldCustom(
                    controller: city,
                    hint: "City",
                    focusNode: cityFocusNode,
                    nextFocusNode: stateFocusNode,
                  ),
                  TextFieldCustom(
                    controller: state,
                    hint: "State",
                    focusNode: stateFocusNode,
                    nextFocusNode: zipcodeFocusNode,
                  ),
                  TextFieldCustom(
                    controller: zipcode,
                    hint: "Zipcode",
                    focusNode: zipcodeFocusNode,
                    nextFocusNode: instructionFocusNode,
                  ),
                  TextFieldCustom(
                    controller: instruction,
                    hint: "Delivery Instruction",
                    focusNode: instructionFocusNode,
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
                    if (address.text.isEmpty ||
                        unit.text.isEmpty ||
                        city.text.isEmpty ||
                        state.text.isEmpty ||
                        zipcode.text.isEmpty ||
                        instruction.text.isEmpty) {
                      var snackBar = const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('please enter All details'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      String? token = await prefs.getString('token');

                      if (token != null) {
                        var box = await Hive.openBox('users_address');
                        List<Map<dynamic, dynamic>>? userAddresses =
                            box.get(token)?.cast<Map<dynamic, dynamic>>();

                        userAddresses = userAddresses ?? [];

                        userAddresses.add({
                          'address': address.text,
                          'unit': unit.text,
                          'city': city.text,
                          'state': state.text,
                          'zipcode': zipcode.text,
                          'instruction': instruction.text,
                        });

                        box.put(token, userAddresses);
                      }
                      var snackBar = const SnackBar(
                          backgroundColor: AppColor.primary,
                          content: Text('Details Add'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      Navigator.pop(context);
                    }
                  },
                  title: 'Add'),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
