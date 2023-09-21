import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_color.dart';
import '../constants/textstyles.dart';

class CategoryItem extends StatelessWidget {
  final String judul;
  final String tempat;
  final String harga;
  final String gambar;
  final String pages;
  final dynamic argument;

  const CategoryItem({
    Key? key,
    required this.judul,
    required this.tempat,
    required this.harga,
    required this.gambar,
    required this.pages,
    this.argument,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, pages, arguments: argument);
      },
      child: Container(
        margin: EdgeInsets.only(right: 10.w),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              width: 222.w,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 235, 235, 235),
                borderRadius: BorderRadius.circular(13.r),
                image: DecorationImage(
                  image: AssetImage(gambar),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              width: 222.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(13.r),
                  bottomRight: Radius.circular(13.r),
                ),
                color: Colors.transparent,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    right: 14.w, left: 14.w, top: 6.h, bottom: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          judul,
                          style: AppTextStyle.defaultHeaderThree.copyWith(
                            color: AppColor.thirdTextColor,
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColor.thirdTextColor,
                              size: 10.r,
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              tempat,
                              style: AppTextStyle.loca2,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "\$ $harga",
                          style: AppTextStyle.defaultHeaderThree.copyWith(
                            color: AppColor.thirdTextColor,
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              "/person",
                              style: AppTextStyle.loca2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
