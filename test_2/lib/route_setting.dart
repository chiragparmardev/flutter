// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:test_2/screen/add_edit_course.dart';
import 'package:test_2/screen/home.dart';

class MyRouter {
  static const String root = "/";
  static const String home = "/home";
  static const String add_edit_course = "/add_edit_course";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget page = const HomeScreen();

    switch (settings.name) {
      case root:
        page = const HomeScreen();
        break;
      case home:
        page = const HomeScreen();
        break;
      case add_edit_course:
        page = const AddEditCourseScreen();
        break;
    }
    return MaterialPageRoute<dynamic>(builder: (_) => page, settings: settings);
  }

  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (context) => const Scaffold(
        body: Center(child: Text('Route Not Found')),
      ),
    );
  }
}
