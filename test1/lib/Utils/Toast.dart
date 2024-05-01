// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utility {
  static void showErrorMessage(String message,
      {bool enableShortToast = false}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: enableShortToast ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
