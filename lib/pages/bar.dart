// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app_flutter/pages/cart/cart.dart';
import 'package:travel_app_flutter/pages/favourite/favourite.dart';
import 'package:travel_app_flutter/pages/home/home.dart';
import 'package:travel_app_flutter/pages/profile/profile.dart';
import '../widgets/app_bottom_bar.dart';

class BarPage extends StatefulWidget {
  const BarPage({Key? key}) : super(key: key);

  @override
  _BarPageState createState() => _BarPageState();
}

class _BarPageState extends State<BarPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 1.sh,
            width: 1.sw,
            child: appDisplayPage(index: index),
          ),
          Positioned(
            bottom: 0,
            width: 1.sw,
            child: AppBottomBar(
              index: index,
              onTap: (int i) {
                setSelectedIndexPage(index: i);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget appDisplayPage({int index = 0}) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const FavouritePage();
      case 2:
        return const CartPage();
      case 3:
        return const ProfilePage();
      default:
        return const BarPage();
    }
  }

  void setSelectedIndexPage({int index = 0}) {
    setState(() {
      this.index = index;
    });
  }
}

class BarController {
  int indexBar = 0;

  void setSelectedIndexPage({int index = 0}) {
    indexBar = index;
  }
}
