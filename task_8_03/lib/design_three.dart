import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class DesignThree extends StatelessWidget {
  const DesignThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'RichText Example',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              letterSpacing: 1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.black, fontSize: 25),
            children: <TextSpan>[
              const TextSpan(
                  text: 'Single ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue)),
              const TextSpan(
                  text: ' Line ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      backgroundColor: Colors.green)),
              TextSpan(
                  text: ' Multiple ',
                  // style: GoogleFonts.robotoMono(
                  //   color: Colors.yellow[900],
                  // )
                  style: TextStyle(
                      fontFamily: "roboto", color: Colors.yellow[900])),
              const TextSpan(
                  text: ' Styles',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700,
                    color: Colors.red,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
