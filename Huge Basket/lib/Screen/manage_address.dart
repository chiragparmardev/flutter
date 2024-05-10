import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_27_03/Cutom/Appbar/appbar_custom.dart';
import 'package:task_27_03/Utils/AppColor.dart';
import 'package:task_27_03/route_setting.dart';

class ManageAddressScreen extends StatefulWidget {
  const ManageAddressScreen({super.key});

  @override
  State<ManageAddressScreen> createState() => _ManageAddressScreenState();
}

class _ManageAddressScreenState extends State<ManageAddressScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetchUserAddresses();
  }

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

  Future<void> deleteAddress(int index) async {
    var box = await Hive.openBox('users_address');

    String? token = await _getToken();
    List<dynamic>? addresses = await box.get(token);

    if (addresses != null && index >= 0 && index < addresses.length) {
      addresses.removeAt(index);
      await box.put(token, addresses);
    }
  }

  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  List<Map<dynamic, dynamic>>? userAddresses;

  void _fetchUserAddresses() async {
    List<Map<dynamic, dynamic>>? addresses = await getUserAddresses();
    setState(() {
      userAddresses = addresses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greyBg,
      appBar: uiHelper.CustomAppbar(() {
        Navigator.pop(context);
      }, 'Manage Address'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Column(
                      children: List.generate(
                    userAddresses?.length ?? 0,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColor.black.withOpacity(0.1),
                                  offset: const Offset(0, 0),
                                  blurRadius: 5)
                            ]),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  CustomRadioAddress(
                                    isSelected: index == selectedIndex,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "${userAddresses![index]['address']}, ${userAddresses![index]['unit']}, ${userAddresses![index]['city']}, ${userAddresses![index]['state']}, ${userAddresses![index]['zipcode']}, ${userAddresses![index]['instruction']}",
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.textaddress),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 1,
                              width: double.infinity,
                              color: AppColor.divider,
                            ),
                            SizedBox(
                              height: 48,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _showDeleteConfirmationDialog(index);
                                        });
                                      },
                                      child: const Center(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.delete_outline,
                                            color: Colors.red,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Delete',
                                            style: TextStyle(
                                                color: AppColor.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      )),
                                    ),
                                  ),
                                  Container(
                                      height: double.infinity,
                                      width: 1.5,
                                      color: AppColor.divider),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, MyRouter.edit_address,
                                            arguments: index);
                                      },
                                      child: const Center(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.edit,
                                            color: AppColor.grey500,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Edit',
                                            style: TextStyle(
                                                color: AppColor.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MyRouter.add_address);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 22,
                      width: 22,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(color: AppColor.primary, width: 2)),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: AppColor.primary,
                          size: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Add New',
                      style: TextStyle(
                          color: AppColor.primary,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this address?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _deleteAddress(index);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _deleteAddress(int index) async {
    await deleteAddress(index);
    _fetchUserAddresses();
  }
}

class CustomRadioAddress extends StatelessWidget {
  const CustomRadioAddress({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: 18,
      decoration: BoxDecoration(
        color: isSelected ? AppColor.primary : AppColor.grey200,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Container(
          height: 6,
          width: 6,
          decoration: BoxDecoration(
            color: isSelected ? AppColor.white : AppColor.grey,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
