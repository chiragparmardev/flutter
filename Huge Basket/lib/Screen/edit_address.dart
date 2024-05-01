// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_27_03/Cutom/Appbar/appbar_custom.dart';
import 'package:task_27_03/Cutom/Button/full_button_custom.dart';
import 'package:task_27_03/Cutom/TextField/text_field_custom.dart';
import 'package:task_27_03/Utils/AppColor.dart';

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({super.key});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
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

  late int addressIndex;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getAddressIndex();
    });
  }

  void getAddressIndex() {
    var args = ModalRoute.of(context)!.settings.arguments;
    if (args is int) {
      setState(() {
        addressIndex = args;
      });
      getUserAddresses();
    } else {
      print("something went worng");
    }
  }

  Future getUserAddresses() async {
    var box = await Hive.openBox('users_address');

    String? token = await _getToken();
    List<dynamic>? addresses = await box.get(token);
    if (addresses != null) {
      List<Map<dynamic, dynamic>> convertedAddresses =
          addresses.cast<Map<dynamic, dynamic>>().toList();
      setState(() {
        address.text = convertedAddresses[addressIndex]['address'] ?? '';
        unit.text = convertedAddresses[addressIndex]['unit'] ?? '';
        city.text = convertedAddresses[addressIndex]['city'] ?? '';
        state.text = convertedAddresses[addressIndex]['state'] ?? '';
        zipcode.text = convertedAddresses[addressIndex]['zipcode'] ?? '';
        instruction.text =
            convertedAddresses[addressIndex]['instruction'] ?? '';
      });
    } else {
      return null;
    }
  }

  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

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
    var addressIndex = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: uiHelper.CustomAppbar(() {
        Navigator.pop(context);
      }, 'Edit Address'),
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
                      var box = await Hive.openBox('users_address');
                      String? token = await _getToken();
                      List<dynamic>? addresses = await box.get(token);
                      if (addresses != null) {
                        List<Map<dynamic, dynamic>> convertedAddresses =
                            addresses.cast<Map<dynamic, dynamic>>().toList();

                        convertedAddresses[addressIndex] = {
                          'address': address.text,
                          'unit': unit.text,
                          'city': city.text,
                          'state': state.text,
                          'zipcode': zipcode.text,
                          'instruction': instruction.text,
                        };

                        await box.put(token, convertedAddresses);
                      }

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
      ),
    );
  }
}
