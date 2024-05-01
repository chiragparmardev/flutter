// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DesignOne extends StatelessWidget {
  const DesignOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Register Form',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelStyle:
                    TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                hintText: 'Enter your Name',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter Your Email',
                labelStyle: TextStyle(color: Colors.red),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                prefixIcon: Icon(
                  Icons.contact_page_rounded,
                  color: Colors.red,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2),
                ),
              ),
            ),
            Text(
              'email',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
              ),
            ),
            Text(
              'Password',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.security,
                  color: Colors.grey,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text(
                  "Register",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
