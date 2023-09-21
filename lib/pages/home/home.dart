// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app_flutter/app_routes.dart';
import 'package:travel_app_flutter/constants/textstyles.dart';
import 'package:travel_app_flutter/constants/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app_flutter/widgets/category_widget.dart';
import 'package:travel_app_flutter/widgets/judul_widget.dart';

import '../../model/place_model.dart';
import '../../widgets/category_item.dart';
import '../../widgets/popular_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Place> places = [];

  String selectedCategory = "mountain";
  bool stillInit = true;

  Future<void> fetchData() async {
    try {
      var json = await rootBundle.loadString('assets/json/destination.json');
      var response = jsonDecode(json);
      List<Place> placesList = [];
      for (var item in response) {
        var place = Place.fromJson(item);
        placesList.add(place);
      }
      places = placesList;
      print("Data fetched successfully: ${places.length} places");
    } catch (error) {
      print("Error fetching data: $error");
    } finally {
      stillInit = false;
    }
  }

  bool isSelectedCategory(String category) {
    return selectedCategory == category;
  }

  void setSelectedCategory(String category) {
    selectedCategory = category;
    setState(() {});
  }

  List<Place> filterPlaces() {
    return places.where((place) => place.category == selectedCategory).toList();
  }

  @override
  void initState() {
    super.initState();
    fetchData().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    if (stillInit) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: mediaQueryData.viewInsets,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 44.h, left: 25.w, right: 25.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 36.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: AppColor.bgColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.r),
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/icons/menu.svg",
                            height: 18.h,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Current Location",
                              style: AppTextStyle.defaultStyle),
                          SizedBox(
                            height: 6.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppColor.primaryColor,
                                size: 14.r,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                "Garut, Jawa Barat",
                                style: AppTextStyle.loca,
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        width: 36.w,
                        height: 36.h,
                        child: const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/profil2.png"),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 36.w,
                  ),
                  const JudulWidget(judul: "Category"),
                  SizedBox(
                    height: 22.h,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CategoryWidget(
                          gambar: "assets/icons/MOUNTAIN.png",
                          judul: "Mountain",
                          onTap: () {
                            setSelectedCategory("mountain");
                          },
                          color: isSelectedCategory("mountain")
                              ? AppColor.primaryColor
                              : AppColor.bgColor,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        CategoryWidget(
                          gambar: "assets/icons/WATERFALL.png",
                          judul: "Waterfall",
                          onTap: () {
                            setSelectedCategory("waterfall");
                          },
                          color: isSelectedCategory("waterfall")
                              ? AppColor.primaryColor
                              : AppColor.bgColor,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        CategoryWidget(
                          gambar: "assets/icons/BEACH.png",
                          judul: "Beach",
                          onTap: () {
                            setSelectedCategory("beach");
                          },
                          color: isSelectedCategory("beach")
                              ? AppColor.primaryColor
                              : AppColor.bgColor,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        CategoryWidget(
                          gambar: "assets/icons/FOREST.png",
                          judul: "Forest",
                          onTap: () {
                            setSelectedCategory("forest");
                          },
                          color: isSelectedCategory("forest")
                              ? AppColor.primaryColor
                              : AppColor.bgColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Column(children: [
                    Container(
                      height: 130,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: filterPlaces().length,
                        itemBuilder: (context, index) {
                          return CategoryItem(
                            judul: filterPlaces()[index].placeName!,
                            tempat: filterPlaces()[index].location!,
                            harga: filterPlaces()[index].price.toString(),
                            gambar: filterPlaces()[index].image!,
                            pages: AppRoutes.detail,
                            argument: {
                              'judul': filterPlaces()[index].placeName!,
                              'tempat': filterPlaces()[index].location!,
                              'harga': filterPlaces()[index].price.toString(),
                              'gambar': filterPlaces()[index].image!,
                              'description': filterPlaces()[index].description!
                            },
                          );
                        },
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 36.h,
                  ),
                  const JudulWidget(judul: "Popular Destination"),
                  SizedBox(
                    height: 22.h,
                  ),
                  const PopularWidget(
                    address: "Komodo Island, Indonesia",
                    desc:
                        "This exceptional beach gets its striking color from microscopic animals called...",
                    price: 53,
                    title: "The Pink Beach",
                    image: "assets/images/Pink.png",
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  const PopularWidget(
                    address: "Bali, Indonesia",
                    desc:
                        "A Meru tower or pelinggih meru is the principal shrine of a Balinese temple. It is a wooden..",
                    price: 48,
                    title: "Meru Tower",
                    image: "assets/images/Meru.png",
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  const PopularWidget(
                    address: "South Sulawesi, Indonesia",
                    desc:
                        "Toraja land is one the tourist destination area in indonesia that must be visited because it..",
                    price: 32,
                    title: "Toraja Land",
                    image: "assets/images/Toraja.png",
                  ),
                  SizedBox(
                    height: 100.h,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
