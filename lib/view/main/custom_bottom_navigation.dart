import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustombottomNavigatoinBarItem extends StatelessWidget {
  String image;
  String text;
  Color color;
  CustombottomNavigatoinBarItem(
      {super.key,
      required this.image,
      required this.text,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 20.h,
          width: 20.w,
          color: color,
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.8,
              color: color),
        )
      ],
    );
  }
}
