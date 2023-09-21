import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app_flutter/pages/bar.dart';
import 'package:travel_app_flutter/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        title: 'Travel Kuy',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const BarPage(),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.bar,
        routes: AppRoutes.routes,
      ),
      designSize: const Size(375, 812),
    );
  }
}
