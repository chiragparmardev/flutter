import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdderssProvider with ChangeNotifier {
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

  List<Map<dynamic, dynamic>>? userAddresses;

  int selectedIndex = 0;

  void close() async {
    address.clear();
    unit.clear();
    city.clear();
    state.clear();
    zipcode.clear();
    instruction.clear();

    addressFocusNode.dispose();
    unitFocusNode.dispose();
    cityFocusNode.dispose();
    stateFocusNode.dispose();
    zipcodeFocusNode.dispose();
    instructionFocusNode.dispose();
    notifyListeners();
  }

  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> addAddress() async {
    String? token = await _getToken();

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
      fetchUserAddresses();
      address.clear();
      unit.clear();
      city.clear();
      state.clear();
      zipcode.clear();
      instruction.clear();
    }
    notifyListeners();
  }

  void fetchUserAddresses() async {
    List<Map<dynamic, dynamic>>? addresses = await getUserAddresses();
    userAddresses = addresses;
    notifyListeners();
  }

  Future<List<Map<dynamic, dynamic>>?> getUserAddresses() async {
    var box = await Hive.openBox('users_address');

    String? token = await _getToken();
    List<dynamic>? addresses = await box.get(token);
    if (addresses != null) {
      List<Map<dynamic, dynamic>> convertedAddresses =
          addresses.cast<Map<dynamic, dynamic>>().toList();
      return convertedAddresses;
    } else {
      return null;
    }
  }

  Future<void> deleteAddress(int index) async {
    var box = await Hive.openBox('users_address');

    String? token = await _getToken();
    List<dynamic>? addresses = await box.get(token);

    if (addresses != null && index >= 0 && index < addresses.length) {
      addresses.removeAt(index);
      await box.put(token, addresses);
    }
    fetchUserAddresses();
    notifyListeners();
  }

  void getAddressIndex(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments;
    if (args is int) {
      addressIndex = args;
      getUserAddressesForEdit();
    } else {
      print("something went worng");
    }
  }

  Future getUserAddressesForEdit() async {
    var box = await Hive.openBox('users_address');

    String? token = await _getToken();
    List<dynamic>? addresses = await box.get(token);
    if (addresses != null) {
      List<Map<dynamic, dynamic>> convertedAddresses =
          addresses.cast<Map<dynamic, dynamic>>().toList();

      address.text = convertedAddresses[addressIndex]['address'] ?? '';
      unit.text = convertedAddresses[addressIndex]['unit'] ?? '';
      city.text = convertedAddresses[addressIndex]['city'] ?? '';
      state.text = convertedAddresses[addressIndex]['state'] ?? '';
      zipcode.text = convertedAddresses[addressIndex]['zipcode'] ?? '';
      instruction.text = convertedAddresses[addressIndex]['instruction'] ?? '';
    } else {
      return null;
    }
  }

  Future<void> editAddress() async {
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
    address.clear();
    unit.clear();
    city.clear();
    state.clear();
    zipcode.clear();
    instruction.clear();
    fetchUserAddresses();
    notifyListeners();
  }
}
