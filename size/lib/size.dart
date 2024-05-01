// ignore_for_file: unnecessary_null_comparison, camel_case_types

import 'package:flutter/widgets.dart';

extension SizeExtension on num {
  double get cw => size.cw(toDouble());
  double get ch => size.ch(toDouble());
  double get r => size.r(toDouble());
  double get fs => size.fs(toDouble());
}

class size {
  static late BuildContext _context;

  static BuildContext get context {
    if (_context == null) {
      throw Exception("Context has not been set.");
    }
    return _context;
  }

  static void setContext(BuildContext context) {
    _context = context;
  }

  static double w() {
    return MediaQuery.of(context).size.width;
  }

  static double h() {
    return MediaQuery.of(context).size.height;
  }

  static double ch(double factor) {
    if (factor == 1.0) {
      return double.infinity;
    }
    return h() * factor;
  }

  static double cw(double factor) {
    if (factor == 1.0) {
      return double.infinity;
    }
    return w() * factor;
  }

  static double r(double scaleFactor) {
    return MediaQuery.of(context).size.shortestSide * scaleFactor;
  }

  static double fs(double scaleFactor) {
    double screenWidth = w();
    double screenHeight = h();
    double fontSize = screenWidth < screenHeight ? screenWidth : screenHeight;
    fontSize *= scaleFactor;
    return fontSize;
  }
}
