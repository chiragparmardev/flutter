import 'package:flutter/material.dart';

class AlertDialogDemo extends StatefulWidget {
  const AlertDialogDemo({super.key});

  @override
  State<AlertDialogDemo> createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  // ringtone selectedValue = ringtone.None;
  int selectedValue = 0;

  List<String> title = [
    'Basic Dailog Title',
    'Customer Agreement',
    'Phone Ringtone',
    'Your Preffered Color'
  ];

  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;

  List<String> content = [
    'A dialog is a type of model window that appers infront of app content to provide criticl informatin or prompt for a decision to be made',
    "by clicking 'AGREE' you agree to the terms of use and privacy policy",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert Dialog Example"),
      ),
      body: ListView.builder(
        itemCount: title.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(title[index]),
            onTap: () {
              if (index == 0) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(title[index]),
                    content: Text(content[index]),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Ok",
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  ),
                );
              } else if (index == 1) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(title[index]),
                    content: Text(content[index]),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "DISAGREE",
                            style: TextStyle(color: Colors.grey),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "AGREE",
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  ),
                );
              } else if (index == 2) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                      // actions: [
                      //   TextButton(
                      //       onPressed: () {
                      //         Navigator.pop(context);
                      //       },
                      //       child: const Text(
                      //         "Sure",
                      //         style: TextStyle(color: Colors.black),
                      //       ))
                      // ],
                      title: const Text('Phone Ringtone'),
                      content: StatefulBuilder(
                        builder: (context, setState) {
                          return Wrap(children: [
                            RadioListTile(
                              groupValue: selectedValue,
                              value: 1,
                              onChanged: (value) => setState(() {
                                selectedValue = value!;
                              }),
                              title: const Text('none'),
                            ),
                            RadioListTile(
                              groupValue: selectedValue,
                              value: 2,
                              onChanged: (value) => setState(() {
                                selectedValue = value!;
                              }),
                              title: const Text('Classic rock'),
                            ),
                            RadioListTile(
                              groupValue: selectedValue,
                              value: 3,
                              onChanged: (value) => setState(() {
                                selectedValue = value!;
                              }),
                              title: const Text('Monophonic'),
                            ),
                            RadioListTile(
                              groupValue: selectedValue,
                              value: 4,
                              onChanged: (value) => setState(() {
                                selectedValue = value!;
                              }),
                              title: const Text('Luna'),
                            )
                          ]);
                        },
                      )),
                );
              } else if (index == 2) {
                showDialog(
                    context: context,
                    builder: (context) => StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              title: const Text('Phone Ringtone'),
                              content: Wrap(children: [
                                RadioListTile(
                                  groupValue: selectedValue,
                                  value: 1,
                                  onChanged: (value) => setState(() {
                                    selectedValue = value!;
                                  }),
                                  title: const Text('none'),
                                ),
                                RadioListTile(
                                  groupValue: selectedValue,
                                  value: 2,
                                  onChanged: (value) => setState(() {
                                    selectedValue = value!;
                                  }),
                                  title: const Text('Classic rock'),
                                ),
                                RadioListTile(
                                  groupValue: selectedValue,
                                  value: 3,
                                  onChanged: (value) => setState(() {
                                    selectedValue = value!;
                                  }),
                                  title: const Text('Monophonic'),
                                ),
                                RadioListTile(
                                  groupValue: selectedValue,
                                  value: 4,
                                  onChanged: (value) => setState(() {
                                    selectedValue = value!;
                                  }),
                                  title: const Text('Luna'),
                                )
                              ]),
                            );
                          },
                        ));
              } else if (index == 3) {
                showDialog(
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: (context, setState) {
                      return AlertDialog(
                        title: const Text('Phone Ringtone'),
                        content: Wrap(children: [
                          ListTile(
                            title: const Text('Red'),
                            leading: Checkbox(
                                value: isChecked1,
                                onChanged: (value) => setState(() {
                                      isChecked1 = value!;
                                    })),
                          ),
                          ListTile(
                            title: const Text('Green'),
                            leading: Checkbox(
                                value: isChecked2,
                                onChanged: (value) => setState(() {
                                      isChecked2 = value!;
                                    })),
                          ),
                          ListTile(
                            title: const Text('Blue'),
                            leading: Checkbox(
                                value: isChecked3,
                                onChanged: (value) => setState(() {
                                      isChecked3 = value!;
                                    })),
                          ),
                          ListTile(
                            title: const Text('Purple'),
                            leading: Checkbox(
                                value: isChecked4,
                                onChanged: (value) => setState(() {
                                      isChecked4 = value!;
                                    })),
                          ),
                          ListTile(
                            title: const Text('Orange'),
                            leading: Checkbox(
                                value: isChecked5,
                                onChanged: (value) => setState(() {
                                      isChecked5 = value!;
                                    })),
                          ),
                        ]),
                        actions: [
                          TextButton(
                            child: const Text(
                              "Cancle",
                              style: TextStyle(color: Colors.grey),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          TextButton(
                            child: const Text(
                              "Ok",
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      );
                    },
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
