// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormCLass {
  String fullName;
  String Email;

  FormCLass(this.fullName, this.Email);
}

class DesignFive extends StatefulWidget {
  const DesignFive({super.key});

  @override
  State<DesignFive> createState() => _DesignFiveState();
}

class _DesignFiveState extends State<DesignFive> {
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();
  List<FormCLass> formList = [];

  @override
  Widget build(BuildContext context) {
    final keyboardsize = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text(
              'Text- Field',
              style: TextStyle(
                fontFamily: 'Honk',
                fontSize: 35,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Register',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: textfield(name),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    style: GoogleFonts.dancingScript(),
                    keyboardType: TextInputType.number,
                    controller: pass,
                    decoration: InputDecoration(
                      hintText: 'Enter the password',
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.red)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    style: GoogleFonts.happyMonkey(),
                    keyboardType: TextInputType.name,
                    controller: email,
                    decoration: InputDecoration(
                      hintText: 'Enter the Email',
                      // labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.red)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  keyboardsize != 0
                      ? Text("Keyboard size = $keyboardsize")
                      : const SizedBox(
                          height: 20,
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade900),
                      onPressed: () {
                        FocusScope.of(context).unfocus();

                        if (name.text.isNotEmpty &&
                            email.text.isNotEmpty &&
                            pass.text.isNotEmpty) {
                          String enteredName = name.text;
                          String enteredEmail = email.text;
                          formList.add(FormCLass(enteredName, enteredEmail));
                          name.clear();
                          pass.clear();
                          email.clear();
                        } else {
                          var snackBar = const SnackBar(
                            content: Text('Field Require'),
                            backgroundColor: Colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }

                        setState(() {});
                      },
                      child: Text(
                        "Dismiss Keyboard / Submit",
                        style: GoogleFonts.dancingScript(
                            color: Colors.white, fontSize: 30),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  formList.isNotEmpty
                      ? Container(
                          color: Colors.blue.shade900,
                          child: const Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Name',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Email',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                            ],
                          ),
                        )
                      : SizedBox(),
                  formList.isNotEmpty
                      ? Column(
                          children: List.generate(
                            formList.length,
                            (index) => Row(
                              children: [
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(formList[index].fullName),
                                )),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(formList[index].Email),
                                )),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ),
        ));
  }

  TextField textfield(TextEditingController name) {
    return TextField(
      controller: name,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Enter the Name',
        labelText: "Full Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
