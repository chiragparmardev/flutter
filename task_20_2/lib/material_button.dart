import 'package:flutter/material.dart';

class MaterialButtonAll extends StatelessWidget {
  const MaterialButtonAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              MaterialButton(
                onPressed: () {},
                child: const Text('Default Material Button'),
              ),
              MaterialButton(
                onPressed: () {},
                child: const SizedBox(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Material Button with Icon'),
                    ],
                  ),
                ),
              ),
              const MaterialButton(
                onPressed: null,
                disabledTextColor: Colors.grey,
                child: Text('Disable Material button'),
              ),
              const MaterialButton(
                onPressed: null,
                child: SizedBox(
                  width: 220,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Disable Material button icon'),
                    ],
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: const Text('Border Material button'),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(10)),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black)))),
                child: const Text(
                  "Border Material Button",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(10)),
                    foregroundColor: MaterialStateProperty.all(Colors.red),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        side: const BorderSide(color: Colors.green)))),
                child: const Text("Rounded Material Button",
                    style: TextStyle(color: Colors.black)),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(10)),
                    foregroundColor: MaterialStateProperty.all(Colors.red),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.red)))),
                child: const Text("Customize Rounded Material Button",
                    style: TextStyle(color: Colors.black)),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(10)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Colors.blue)))),
                child: const Text("Customize Text Style of Label",
                    style: TextStyle(
                        color: Colors.black, fontStyle: FontStyle.italic)),
              ),
            ])));
  }
}

class ButtonTwo extends StatelessWidget {
  const ButtonTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 170,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(10)),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white)))),
                child: const Row(
                  children: [
                    Icon(
                      Icons.apple,
                      color: Colors.black,
                    ),
                    Text("Sign in with Apple",
                        style: TextStyle(
                            color: Colors.black, fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 170,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(10)),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black)))),
                child: const Row(
                  children: [
                    Icon(
                      Icons.apple,
                      color: Colors.black,
                    ),
                    Text("Sign in with Apple",
                        style: TextStyle(
                            color: Colors.black, fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 170,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(10)),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black)))),
                child: const Row(
                  children: [
                    Icon(
                      Icons.apple,
                      color: Colors.white,
                    ),
                    Text("Sign in with Apple",
                        style: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 170,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white))),
                ),
                child: Row(
                  children: [
                    SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1024px-Google_%22G%22_logo.svg.png',
                        )),
                    const Text("Sign in with Google",
                        style: TextStyle(
                            color: Colors.black, fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 190,
              color: Colors.blue,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue))),
                ),
                child: Row(
                  children: [
                    Container(
                        color: Colors.white,
                        height: 35,
                        width: 35,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/2048px-Google_%22G%22_logo.svg.png',
                          ),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Sign in with Google",
                        style: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 190,
              color: Colors.blue[900],
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[900]),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue))),
                ),
                child: Row(
                  children: [
                    SizedBox(
                        height: 35,
                        width: 35,
                        child: Image.network(
                          'https://i.pinimg.com/originals/ce/d6/6e/ced66ecfc53814d71f8774789b55cc76.png',
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Sign in with Google",
                        style: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 190,
              color: Colors.grey[500],
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[500]),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey))),
                ),
                child: Row(
                  children: [
                    SizedBox(
                        height: 35,
                        width: 35,
                        child: Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Logo_of_Twitter.svg/512px-Logo_of_Twitter.svg.png',
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Sign in with Twitter",
                        style: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              color: Colors.white,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey))),
                ),
                child: Row(
                  children: [
                    SizedBox(
                        height: 35,
                        width: 35,
                        child: Image.network(
                          'https://e1.pngegg.com/pngimages/388/781/png-clipart-microsoft-windows-logo-3000px-microsoft-logo.png',
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Sign in with Microsoft",
                        style: TextStyle(
                            color: Colors.black, fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              color: Colors.black,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black))),
                ),
                child: Row(
                  children: [
                    SizedBox(
                        height: 35,
                        width: 35,
                        child: Image.network(
                          'https://e1.pngegg.com/pngimages/388/781/png-clipart-microsoft-windows-logo-3000px-microsoft-logo.png',
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Sign in with Microsoft",
                        style: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
