// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:task_27_03/Screen/add_address.dart';
import 'package:task_27_03/Screen/add_more_details.dart';
import 'package:task_27_03/Screen/cart.dart';
import 'package:task_27_03/Screen/chat.dart';
import 'package:task_27_03/Screen/edit_address.dart';
import 'package:task_27_03/Screen/edit_profile.dart';
import 'package:task_27_03/Screen/get_started.dart';
import 'package:task_27_03/Screen/home.dart';
import 'package:task_27_03/Screen/manage_address.dart';
import 'package:task_27_03/Screen/mobile_login.dart';
import 'package:task_27_03/Screen/notification.dart';
import 'package:task_27_03/Screen/order_confirm.dart';
import 'package:task_27_03/Screen/otp.dart';
import 'package:task_27_03/Screen/place_your_order.dart';
import 'package:task_27_03/Screen/product_details.dart';
import 'package:task_27_03/Screen/product_more.dart';
import 'package:task_27_03/Screen/recent_chat.dart';
import 'package:task_27_03/Screen/splace_screen.dart';
import 'package:task_27_03/Screen/store_details_nested.dart';
import 'package:task_27_03/Screen/store_page.dart';
import 'package:task_27_03/Screen/store_product.dart';

class MyRouter {
  static const String root = "/";
  static const String get_started = "/get_started";
  static const String mobile_login = "/mobile_login";
  static const String add_more_details = "/add_more_details";
  static const String otp = "/otp";
  static const String home_page = "/home_page";
  static const String store_page = "/atore_page";
  static const String store_details = "/store_details";
  static const String store_product = "/store_product";
  static const String product_more = "/product_more";
  static const String product_details = "/product_details";
  static const String order_confirm = "/order_confirm";
  static const String cart = "/cart";
  static const String edit_profile = "/edit_profile";
  static const String notifications = "/notifications";
  static const String add_address = "/add_address";
  static const String edit_address = "/edit_address";
  static const String manage_address = "/manage_address";
  static const String place_your_order = "/place_your_order";
  static const String recent_chat = "/recent_chat";
  static const String chat = "/chat";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget page = const SplaceScreen();

    switch (settings.name) {
      case root:
        page = const SplaceScreen();
        break;
      case get_started:
        page = const GetStarted();
        break;
      case add_more_details:
        page = const AddMoreDetails();
        break;
      case mobile_login:
        page = const MobileLogin();
        break;
      case otp:
        page = const OtpPage();
        break;
      case home_page:
        page = const HomePage();
        break;
      case store_page:
        page = const StorePage();
        break;
      case store_details:
        page = const StoreDetailsNested();
        break;
      case store_product:
        page = const StoreProduct();
        break;
      case product_more:
        page = const ProductMore();
        break;
      case product_details:
        page = const ProductDetails();
        break;
      case cart:
        page = const Cart();
        break;
      case order_confirm:
        page = const OrderConfirm();
        break;
      case edit_profile:
        page = const EditProfile();
        break;
      case notifications:
        page = const NotificationScreen();
        break;
      case add_address:
        page = const AddAddressScreen();
        break;
      case edit_address:
        page = const EditAddressScreen();
        break;
      case manage_address:
        page = const ManageAddressScreen();
        break;
      case place_your_order:
        page = const PlaceYourOrder();
        break;
      case recent_chat:
        page = const RecentChat();
        break;
      case chat:
        page = const ChatScreen();
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
