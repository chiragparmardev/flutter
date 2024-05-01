import 'package:flutter/material.dart';

class DesignTwo extends StatefulWidget {
  const DesignTwo({super.key});

  @override
  State<DesignTwo> createState() => _DesignTwoState();
}

class _DesignTwoState extends State<DesignTwo> {
  bool pro2 = false;

  bool wifi = false;

  bool pro1 = false;

  bool pro3 = false;

  int choice = 0;

  String? pro;
  List<String> product = [
    'Product 1',
    'Product 2',
    'Product 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text(
          'All Fields',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'holo a todos',
                labelText: 'TareaText test',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelStyle: TextStyle(
                    fontSize: 23,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Radio Button tests',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            ListTile(
              leading: const Text(
                "Product 1",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              trailing: Radio(
                value: 1,
                groupValue: choice,
                onChanged: (value) {
                  setState(() {
                    choice = value as int;
                  });
                },
              ),
            ),
            ListTile(
              leading: const Text(
                "Product 2",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              trailing: Radio(
                value: 2,
                groupValue: choice,
                onChanged: (value) {
                  setState(() {
                    choice = value as int;
                  });
                },
              ),
            ),
            ListTile(
              leading: const Text(
                "Product 3",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              trailing: Radio(
                value: 3,
                groupValue: choice,
                onChanged: (value) {
                  setState(() {
                    choice = value as int;
                  });
                },
              ),
            ),
            const Text(
              'Checkbox tests',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            CheckboxListTile(
              value: pro1,
              onChanged: (bool? value) {
                setState(() {
                  pro1 = value!;
                });
              },
              title: const Text(
                'Product 1',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
            ),
            CheckboxListTile(
              value: pro2,
              onChanged: (bool? value) {
                setState(() {
                  pro2 = value!;
                });
              },
              title: const Text(
                'Product 2',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
            ),
            CheckboxListTile(
              value: pro3,
              onChanged: (bool? value) {
                setState(() {
                  pro3 = value!;
                });
              },
              title: const Text(
                'Product 3',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
            ),
            const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "DropDown Button",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
            Align(
              alignment: Alignment.bottomLeft,
              child: DropdownButton(
                hint: Text('Select'),
                value: pro,
                items: product.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    enabled: true,
                    child: Text(e.toString()),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    pro = val!;
                  });
                },
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: const Text(
              "Send",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
