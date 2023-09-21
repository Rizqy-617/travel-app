import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/textstyles.dart';

class CategoryWidget extends StatelessWidget {
  final String gambar;
  final String judul;
  final Function onTap;
  final Color color;

  const CategoryWidget(
      {super.key,
      required this.gambar,
      required this.judul,
      required this.onTap,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 38.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: MaterialButton(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 9.h),
          onPressed: () {
            onTap();
          },
          child: Row(
            children: [
              Image.asset(gambar, fit: BoxFit.cover, height: 20.h),
              SizedBox(
                width: 6.w,
              ),
              Text(
                judul,
                style: AppTextStyle.category,
              )
            ],
          ),
        ));
  }
}
