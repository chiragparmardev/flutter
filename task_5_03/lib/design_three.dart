import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class User {
  final String name;
  final String phone;
  final String email;
  final String age;
  final String address;
  final String dob;
  final String country;
  final String city;

  User(this.name, this.phone, this.email, this.address, this.age, this.city,
      this.country, this.dob);
}

class DesignThree extends StatefulWidget {
  const DesignThree({super.key});

  @override
  State<DesignThree> createState() => _DesignThreeState();
}

class _DesignThreeState extends State<DesignThree> {
  final formkey = GlobalKey<FormState>();
  final List<String> country = [
    'India',
    'USA',
    'U.K',
    'Austria',
  ];
  final Map<String, List<String>> citiesByCountry = {
    'India': ['Delhi', 'Mumbai', 'Bangalore'],
    'USA': ['New York', 'Los Angeles', 'Chicago'],
    'U.K': ['London', 'Manchester', 'Birmingham'],
    'Austria': ['Vienna', 'Salzburg', 'Graz'],
  };

  List<User> userList = [];

  String? selectedCountry;
  String? selectedCity;
  String? val;
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: const Text(
          "Screen 3 Form",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textformfield(
                      hint: "NAME",
                      controller: nameController,
                      types: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter proper name Field';
                        } else if (value.contains(RegExp(r'[1-9]'))) {
                          return 'check the name';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  textformfield(
                      hint: "Phone Number",
                      controller: phoneController,
                      types: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Number only';
                        } else if (value.length < 10) {
                          return 'Enter 10 digit number';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  textformfield(
                      hint: "Email",
                      controller: emailController,
                      types: TextInputType.emailAddress,
                      validator: (value) {
                        RegExp regExp = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if (value == null || value.isEmpty) {
                          return 'Email cant be empty';
                        } else if (!regExp.hasMatch(value)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  textformfield(
                      hint: "Age",
                      types: TextInputType.number,
                      controller: ageController),
                  const SizedBox(
                    height: 15,
                  ),
                  textformfield(
                      hint: "Address",
                      types: TextInputType.streetAddress,
                      controller: addressController),
                  const SizedBox(
                    height: 15,
                  ),
                  textformfield(
                    hint: "Dob",
                    label: "Dob",

                    controller: dateController,
                    types: TextInputType.datetime,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select date.';
                      }
                      return null;
                    },
                    ontap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2050),
                      ).then((choice) {
                        if (choice != null) {
                          dateController.text =
                              DateFormat('dd-MM-yyyy').format(choice);
                        }
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DropdownButtonFormField2<String>(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    hint: const Text(
                      'Country',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: selectedCountry,
                    items: country
                        .map((country) => DropdownMenuItem<String>(
                              value: country,
                              child: Text(
                                country,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCountry = value;
                        selectedCity = null;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a country.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DropdownButtonFormField2<String>(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    hint: const Text(
                      'City',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: selectedCity,
                    items: selectedCountry != null
                        ? citiesByCountry[selectedCountry!]
                            ?.map((city) => DropdownMenuItem<String>(
                                  value: city,
                                  child: Text(
                                    city,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ))
                            .toList()
                        : null,
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a city.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                debugPrint("Submitted");
                                userList.add(User(
                                    nameController.text,
                                    phoneController.text,
                                    emailController.text,
                                    addressController.text,
                                    ageController.text,
                                    selectedCity.toString(),
                                    selectedCountry.toString(),
                                    dateController.text));
                                nameController.clear();
                                phoneController.clear();
                                emailController.clear();
                                addressController.clear();
                                ageController.clear();
                                dateController.clear();
                                selectedCity = null;
                                selectedCountry = null;

                                setState(() {});
                              }
                            },
                            child: const Text("Submit Form")),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                userList.clear();
                              });
                            },
                            child: const Text("Delete Data")),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: userList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Id : $index',style: TextStyle(color:Colors.black),),
                          Text('Name : ${userList[index].name}',style: TextStyle(color:Colors.black)),
                          Text('phone : ${userList[index].phone}',style: TextStyle(color:Colors.black)),
                          Text('email : ${userList[index].email}',style: TextStyle(color:Colors.black)),
                          Text('age : ${userList[index].age}',style: TextStyle(color:Colors.black)),
                          Text('address : ${userList[index].address}',style: TextStyle(color:Colors.black)),
                          Text('date : ${userList[index].dob}',style: TextStyle(color:Colors.black)),
                          Text('Country : ${userList[index].country}',style: TextStyle(color:Colors.black)),
                          Text('City : ${userList[index].city}',style: TextStyle(color:Colors.black)),
                          index == 0
                              ? const SizedBox()
                              : const Text('-------------------------------'),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField textformfield(
      {required String hint,
      required TextInputType? types,
      VoidCallback? ontap,
      String? label,
      TextEditingController? controller,
      String? Function(String?)? validator}) {
    return TextFormField(
      onTap: ontap,
      controller: controller,
      keyboardType: types,
      style: TextStyle(color: Colors.black),
      validator: validator,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.black),

          hintText: hint,
          labelText: label,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.blue))),
    );
  }
}
