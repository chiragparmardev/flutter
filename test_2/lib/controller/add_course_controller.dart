import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddCourseController {
  TextEditingController course = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  String selectedImagePath = '';
  final ImagePicker picker = ImagePicker();

  Future<XFile?> pickImageFromSource(ImageSource source) async {
    XFile? image = await ImagePicker().pickImage(
      source: source,
      imageQuality: 10,
    );
    return image;
  }
}
