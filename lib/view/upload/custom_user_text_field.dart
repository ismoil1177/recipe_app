import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app1/services/constants/app_color.dart';
import 'package:recipe_app1/services/constants/app_str.dart';

class CustomUserTextField extends StatelessWidget {
  TextEditingController controller;
   CustomUserTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return    SizedBox(
            height: 56.h,
            width: 327.w,
            child: TextField(
              style: TextStyle(
                  fontSize: 15.sp,
                  color: AppColors.ff9FA5C0,
                  fontWeight: FontWeight.w500),
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.ff9FA5C0),
                  borderRadius: BorderRadius.all(Radius.circular(32.r)),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.ff9FA5C0),
                  borderRadius: BorderRadius.all(Radius.circular(32.r)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.ff9FA5C0),
                  borderRadius: BorderRadius.all(Radius.circular(32.r)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.ff9FA5C0),
                  borderRadius: BorderRadius.all(Radius.circular(32.r)),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.ff9FA5C0),
                  borderRadius: BorderRadius.all(Radius.circular(32.r)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.ff9FA5C0),
                  borderRadius: BorderRadius.all(Radius.circular(32.r)),
                ),
                hintText: AppStrings.enterUserName,
                hintStyle: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.ff9FA5C0),
              ),
            ),
          );
  }
}