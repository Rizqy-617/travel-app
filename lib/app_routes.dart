import 'package:flutter/material.dart';
import 'package:travel_app_flutter/pages/bar.dart';
import 'package:travel_app_flutter/pages/cart/cart.dart';
import 'package:travel_app_flutter/pages/category/detail_category.dart';
import 'package:travel_app_flutter/pages/favourite/favourite.dart';
import 'package:travel_app_flutter/pages/home/home.dart';
import 'package:travel_app_flutter/pages/profile/profile.dart';

class AppRoutes {
  static const String home = '/home';
  static const String bar = '/bar';
  static const String favourite = '/favourite';
  static const String cart = '/cart';
  static const String profile = '/profile';
  static const String detail = '/detail';

  static final routes = <String, WidgetBuilder>{
    home: (context) => const HomePage(),
    bar: (context) => const BarPage(),
    favourite: (context) => const FavouritePage(),
    cart: (context) => const CartPage(),
    profile: (context) => const ProfilePage(),
    detail: (context) => const DetailPage(),
  };
}
