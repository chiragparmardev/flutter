import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Map<dynamic, dynamic>>?> getUserAddresses() async {
  var box = await Hive.openBox('users_address');

  String? token = await _getToken();
  List<dynamic>? addresses = await box.get(token);
  // print(addresses);
  if (addresses != null) {
    List<Map<dynamic, dynamic>> convertedAddresses =
        addresses.cast<Map<dynamic, dynamic>>().toList();
    return convertedAddresses;
  } else {
    return null;
  }
}

Future<String?> _getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

Future<void> deleteAddress(int index) async {
  var box = await Hive.openBox('users_address');

  String? token = await _getToken();
  List<dynamic>? addresses = await box.get(token);

  if (addresses != null && index >= 0 && index < addresses.length) {
    addresses.removeAt(index);
    await box.put(token, addresses);
  }
}
