import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app_flutter/widgets/preview_image.dart';

import '../../constants/app_color.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    print(args);
    late String image;
    late String judul;
    late String tempat;
    late String description;
    late String harga;
    if (args != null) {
      image = args['gambar'];
      judul = args['judul'];
      tempat = args['tempat'];
      description = args['description'];
      harga = args['harga'];
    }
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     TextButton(
            //       onPressed: () {
            //         Get.back();
            //       },
            //       child: Container(
            //         height: 40.h,
            //         width: 36.w,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(8.r),
            //           color: Colors.white,
            //         ),
            //         child: Center(
            //           child: Icon(
            //             Icons.keyboard_arrow_left_rounded,
            //             size: 18.sp,
            //             color: Colors.black,
            //           ),
            //         ),
            //       ),
            //     ),
            //     TextButton(
            //       onPressed: () {},
            //       child: Container(
            //         height: 40.h,
            //         width: 36.w,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(8.r),
            //           color: Colors.white,
            //         ),
            //         child: Center(
            //           child: Icon(
            //             Icons.favorite_border,
            //             size: 18.sp,
            //             color: const Color.fromARGB(255, 255, 40, 40),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Container(
              width: double.maxFinite,
              height: 380.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            judul,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppColor.primaryColor,
                                size: 16.sp,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                tempat,
                                style: const TextStyle(
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "\$$harga",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            "/Person",
                            style: TextStyle(
                              color: AppColor.secondTextColor,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 18.h,
                  // ),

                  SizedBox(
                    height: 18.h,
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    height: 22.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Preview",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Container(
                          height: 30.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: AppColor.bgColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                size: 18.sp,
                                color: const Color.fromARGB(255, 248, 229, 1),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                "4.8",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const PreviewImage(
                            image: "assets/images/rinjani-4.png"),
                        SizedBox(width: 12.w),
                        const PreviewImage(
                            image: "assets/images/rinjani-3.png"),
                        SizedBox(width: 12.w),
                        const PreviewImage(
                            image: "assets/images/rinjani-2.png"),
                        SizedBox(width: 12.w),
                        const PreviewImage(
                            image: "assets/images/rinjani-1.png"),
                        SizedBox(width: 12.w),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  Container(
                    height: 48.h,
                    width: 325.w,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.white,
                        onTap: () {},
                        child: Center(
                          child: Text(
                            "Book Now",
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ), // Added space at the bottom
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
