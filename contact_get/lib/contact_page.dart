// ignore_for_file: avoid_print, unnecessary_null_comparison, unused_local_variable

import 'dart:async';

import 'package:contacts_service/contacts_service.dart';
// import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  ContactPageState createState() => ContactPageState();
}

class ContactPageState extends State<ContactPage> {
  // Future<List<Contact>> getContacts() async {
  //   bool isGranted = await Permission.contacts.status.isGranted;
  //   if (!isGranted) {
  //     isGranted = await Permission.contacts.request().isGranted;
  //   }
  //   if (isGranted) {
  //     return await ContactsService.getContacts();
  //   }
  //   return [];
  // }
  late StreamController<List<Contact>> _contactsController;
  @override
  void initState() {
    super.initState();
    _contactsController = StreamController<List<Contact>>();
    getContacts();
  }

  @override
  void dispose() {
    _contactsController.close();
    super.dispose();
  }

  void getContacts() async {
    bool isGranted = await Permission.contacts.status.isGranted;
    if (!isGranted) {
      isGranted = await Permission.contacts.request().isGranted;
    }
    if (isGranted) {
      _contactsController.add(await ContactsService.getContacts());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Contact List Page"),
        ),
        body:
            //  FutureBuilder(
            //   future: getContacts(),
            StreamBuilder(
          stream: _contactsController.stream,
          builder: (context, snapshot) {
            if (snapshot.data == null ||
                snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data!.isEmpty) {
              return Center(
                  child: Lottie.asset('assets/json/no_data.json', height: 300));
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Contact contact = snapshot.data![index];
                return Column(
                  children: [
                    Slidable(
                      startActionPane:
                          ActionPane(motion: const StretchMotion(), children: [
                        SlidableAction(
                          onPressed: (BuildContext context) {
                            _updateContact(contact);
                          },
                          backgroundColor: Colors.green,
                          icon: Icons.edit,
                          label: 'Edit',
                        )
                      ]),
                      endActionPane:
                          ActionPane(motion: const BehindMotion(), children: [
                        SlidableAction(
                          onPressed: (BuildContext context) {
                            _deleteContact(contact);
                          },
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                          label: 'Delete',
                        )
                      ]),
                      child: ListTile(
                        leading: const CircleAvatar(
                          radius: 20,
                          child: Icon(Icons.person),
                        ),
                        title: Text(contact.displayName!.isEmpty
                            ? 'No name}'
                            : '${contact.displayName}'),
                        trailing: InkWell(
                            onTap: () async {
                              await FlutterPhoneDirectCaller.callNumber(
                                  '${contact.phones?[0].value}');
                            },
                            child: const Icon(Icons.call)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(contact.phones![0].value!.isEmpty
                                ? 'No Number'
                                : '${contact.phones?[0].value}'),
                            Text(contact.emails!.isEmpty
                                ? 'No email'
                                : '${contact.emails?[0].value}'),
                          ],
                        ),
                      ),
                    ),
                    const Divider()
                  ],
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            try {
              Contact contact = await ContactsService.openContactForm();
              // if (contact != null) {
              //   setState(() {
              //     getContacts();
              //   });
              // }
              getContacts();
            } on FormOperationException catch (e) {
              switch (e.errorCode) {
                case FormOperationErrorCode.FORM_OPERATION_CANCELED:
                  break;
                case FormOperationErrorCode.FORM_COULD_NOT_BE_OPEN:
                  break;
                case null:
                case FormOperationErrorCode.FORM_OPERATION_UNKNOWN_ERROR:
                  print(e.toString());
              }
            }
          },
          child: const Icon(Icons.add),
        ));
  }

  void _deleteContact(Contact contact) {
    ContactsService.deleteContact(contact);
    // setState(() {
    //   getContacts();
    // });
    getContacts();
  }

  void _updateContact(Contact contact) async {
    Contact? updatedContact =
        await ContactsService.openExistingContact(contact);
    if (updatedContact != null) {
      await ContactsService.updateContact(updatedContact);
      // setState(() {
      //   getContacts();
      // });
    }
    getContacts();
  }
}
