import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:task_12_03/AssetsColor.dart';
import 'package:task_12_03/Toast.dart';
import 'package:task_12_03/one_home.dart';

class DesignOne extends StatefulWidget {
  const DesignOne({super.key});

  @override
  State<DesignOne> createState() => _DesignOneState();
}

class _DesignOneState extends State<DesignOne> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AssetsColor.white,
    ));
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Lottie.asset('assets/json/login.json',
                      height: 200, fit: BoxFit.contain),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Login now',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Please enter the details below to continue.',
                ),
                const SizedBox(
                  height: 20,
                ),
                TExtFormFieldCustom(
                  hint: 'Enter your email',
                  icon: email.text.isNotEmpty ? Icons.close : null,
                  ispassword: true,
                  controller: email,
                  clearIconVisible: email.text.isNotEmpty,
                  onChanged: (value) {
                    setState(() {});
                  },
                  ontap: () {
                    email.clear();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TExtFormFieldCustom(
                  hint: 'Enter your password',
                  icon: isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  ispassword: isPasswordVisible,
                  controller: password,
                  clearIconVisible: false,
                  onChanged: (value) {
                    setState(() {});
                  },
                  ontap: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                        style: const ButtonStyle(
                            padding:
                                MaterialStatePropertyAll(EdgeInsets.all(0))),
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey),
                        ))),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                      color: AssetsColor.primary,
                      borderRadius: BorderRadius.circular(10)),
                  clipBehavior: Clip.hardEdge,
                  child: Material(
                    color: Colors.transparent,
                    child: Ink(
                      child: InkWell(
                        onTap: () {
                          bool isValidEmail(String email) {
                            final RegExp emailRegex =
                                RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                            return emailRegex.hasMatch(email);
                          }

                          if (email.text.isEmpty) {
                            Utility.showErrorMessage("Email can/'t be empty ");
                          } else if (!isValidEmail(email.text)) {
                            Utility.showErrorMessage("Enter valid email");
                          } else if (password.text.isEmpty) {
                            Utility.showErrorMessage(
                                "Password can/'t be empty ");
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const OnrHome()));
                          }
                        },
                        child: const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Or Login With',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.grey),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  children: [
                    AuthMore(
                        color: Colors.blue, icon: FontAwesomeIcons.facebookF),
                    SizedBox(
                      width: 20,
                    ),
                    AuthMore(
                      icon: FontAwesomeIcons.google,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    AuthMore(
                      icon: FontAwesomeIcons.apple,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don\'t have an account?"),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: AssetsColor.primary,
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AuthMore extends StatelessWidget {
  final IconData icon;
  final Color? color;
  const AuthMore({super.key, this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}

class TExtFormFieldCustom extends StatelessWidget {
  final String hint;
  final IconData? icon;
  final bool ispassword;
  final TextEditingController controller;
  final bool clearIconVisible;
  final Function ontap;
  final ValueChanged<String>? onChanged;

  const TExtFormFieldCustom({
    super.key,
    required this.hint,
    this.icon,
    required this.ispassword,
    required this.controller,
    required this.clearIconVisible,
    this.onChanged,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        obscureText: !ispassword,
        onChanged: onChanged,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            enabledBorder: null,
            suffixIcon: IconButton(
                onPressed: () {
                  ontap();
                },
                icon: Icon(icon)),
            focusedBorder: null));
  }
}
