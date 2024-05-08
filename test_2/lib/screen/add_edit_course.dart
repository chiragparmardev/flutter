// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_2/AppColor.dart';
import 'package:test_2/Toast.dart';
import 'package:test_2/custom/text_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:hive/hive.dart';
import 'package:test_2/route_setting.dart';

@RoutePage()
class AddEditCourseScreen extends StatefulWidget {
  const AddEditCourseScreen({super.key});

  @override
  State<AddEditCourseScreen> createState() => _AddEditCourseScreenState();
}

class _AddEditCourseScreenState extends State<AddEditCourseScreen> {
  TextEditingController course = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  String selectedImagePath = '';
  final ImagePicker picker = ImagePicker();
  bool isEdit = false;

  Future<XFile?> pickImageFromSource(ImageSource source) async {
    XFile? image = await ImagePicker().pickImage(
      source: source,
      imageQuality: 10,
    );
    return image;
  }

  late int courseIndex;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getcourseIndex();
    });
  }

  void getcourseIndex() {
    var args = ModalRoute.of(context)!.settings.arguments;
    if (args is int) {
      setState(() {
        courseIndex = args;
        isEdit = true;
      });
      getcourse();
    } else {
      // print("something went worng");
      setState(() {
        isEdit = false;
      });
    }
  }

  Future getcourse() async {
    var box = await Hive.openBox('course');
    var courseData = box.getAt(courseIndex);
    if (courseData != null) {
      setState(() {
        course.text = courseData['courseName'];
        description.text = courseData['description'];
        price.text = courseData['price'];
        startDate.text = courseData['startDate'];
        endDate.text = courseData['endDate'];
        selectedImagePath = courseData['courseImage'];
      });
    } else {
      print("Error fetching course data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgGrey,
      appBar: AppBar(
        backgroundColor: AppColor.bgGrey,
        elevation: 0,
        centerTitle: true,
        title: Text(
          isEdit ? 'Edit Course' : 'Add Course',
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColor.textblack),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 2),
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                selectedImagePath != ''
                    ? SizedBox(
                        height: 175,
                        child: Stack(children: [
                          Image.file(
                            File(selectedImagePath),
                            height: 175,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                              right: 0,
                              top: 0,
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedImagePath = '';
                                    });
                                  },
                                  icon: const Icon(Icons.close)))
                        ]),
                      )
                    : Container(
                        height: 175,
                        decoration: const BoxDecoration(
                            color: AppColor.imageBg,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        clipBehavior: Clip.hardEdge,
                        child: Material(
                          color: AppColor.transparent,
                          child: Ink(
                            child: InkWell(
                              onTap: () async {
                                showImagePickDialog(context);
                              },
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/gallery.png',
                                      height: 24,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    const Text(
                                      'Add Image',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.priceBg),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      CustomTextField(controller: course, label: 'Course Name'),
                      CustomTextField(
                        controller: startDate,
                        label: 'Start Date',
                        ontap: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2025),
                            cancelText: 'Cancel',
                          ).then((value) {
                            if (value != null) {
                              startDate.text =
                                  DateFormat('dd MMM, yyyy').format(value);
                            } else {
                              startDate.text = '';
                            }
                          });
                        },
                      ),
                      CustomTextField(
                        controller: endDate,
                        label: 'End Date',
                        ontap: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2025),
                            cancelText: 'Cancel',
                          ).then((value) {
                            if (value != null) {
                              endDate.text =
                                  DateFormat('dd MMM, yyyy').format(value);
                            } else {
                              endDate.text = '';
                            }
                          });
                        },
                      ),
                      CustomTextField(
                        controller: description,
                        label: 'Description',
                        maxline: 4,
                      ),
                      CustomTextField(
                        controller: price,
                        label: 'Price',
                        textInputAction: TextInputAction.done,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 7),
                        decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(50)),
                        clipBehavior: Clip.hardEdge,
                        child: Material(
                          color: AppColor.transparent,
                          child: Ink(
                            child: InkWell(
                              onTap: () async {
                                if (selectedImagePath.isEmpty ||
                                    course.text.isEmpty ||
                                    startDate.text.isEmpty ||
                                    endDate.text.isEmpty ||
                                    description.text.isEmpty ||
                                    price.text.isEmpty) {
                                  Utility.showErrorMessage(
                                      'Please Fill All Fields');
                                } else {
                                  var box = await Hive.openBox('course');

                                  Map<String, dynamic> courseData = {
                                    'courseName': course.text,
                                    'courseImage': selectedImagePath,
                                    'startDate': startDate.text,
                                    'endDate': endDate.text,
                                    'description': description.text,
                                    'price': price.text,
                                  };

                                  isEdit
                                      ? box.putAt(courseIndex, courseData)
                                      : box.add(courseData);

                                  setState(() {
                                    selectedImagePath = '';
                                    course.text = '';
                                    startDate.text = '';
                                    endDate.text = '';
                                    description.text = '';
                                    price.text = '';
                                  });

                                  Utility.showErrorMessage(
                                      isEdit
                                          ? 'Cource Updated'
                                          : 'Cource Added',
                                      error: false);

                                  // Navigator.pushNamedAndRemoveUntil(
                                  //     context, MyRouter.home, (route) => false);
                                  Navigator.pop(context);
                                }
                              },
                              child: Center(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: Text(
                                  isEdit ? 'Edit Cource' : 'Add Cource',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.white),
                                ),
                              )),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showImagePickDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: AppColor.white,
          elevation: 0,
          contentPadding: const EdgeInsets.all(0),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                child: Text(
                  "Add Photo!",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: AppColor.primary),
                ),
              ),
              const Divider(
                color: AppColor.primary,
                thickness: 2,
                height: 1,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: InkWell(
                  onTap: () async {
                    XFile? image =
                        await pickImageFromSource(ImageSource.camera);
                    if (image != null) {
                      selectedImagePath = image.path;
                      Navigator.of(context).pop();
                    }
                    setState(() {});
                  },
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'Take Photo',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColor.black),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 1,
                color: AppColor.grey,
                thickness: 1,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: InkWell(
                  onTap: () async {
                    XFile? image =
                        await pickImageFromSource(ImageSource.gallery);
                    if (image != null) {
                      selectedImagePath = image.path;
                      Navigator.of(context).pop();
                    }
                    setState(() {});
                  },
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'Choose from Gallery',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColor.black),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                color: AppColor.grey,
                thickness: 1,
                height: 1,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColor.black),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}



// AlertDialog(
//   backgroundColor: AppColor.white,
//   elevation: 0,
//   title: const Text(
//     "Add Photo!",
//     style: TextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.w500,
//         color: AppColor.primary),
//   ),
//   content: Column(
//     mainAxisSize: MainAxisSize.min,
//     children: [
//       Divider(
//         color: AppColor.primary,
//       ),
//       ElevatedButton(
//         onPressed: () async {
//           XFile? image =
//               await pickImageFromSource(
//                   ImageSource.camera);
//           if (image != null) {
//             selectedImagePath = image.path;
//             Navigator.of(context).pop();
//           }
//           setState(() {});
//         },
//         child: const Text("Camera"),
//       ),
//       ElevatedButton(
//         onPressed: () async {
//           XFile? image =
//               await pickImageFromSource(
//                   ImageSource.gallery);
//           if (image != null) {
//             selectedImagePath = image.path;
//             Navigator.of(context).pop();
//           }
//           setState(() {});
//         },
//         child: const Text("Gallery"),
//       ),
//     ],
//   ),
// );