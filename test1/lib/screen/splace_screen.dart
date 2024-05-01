// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:test1/screen/home_page.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  void initState() {
    super.initState();
    redirectCheck();
  }

  void redirectCheck() async {
    await Future.delayed(const Duration(seconds: 3));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image(
          image: AssetImage('assets/images/splace_screen.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
