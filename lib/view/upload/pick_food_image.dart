import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app1/services/constants/app_color.dart';
import 'package:recipe_app1/services/constants/app_icons.dart';
import 'package:recipe_app1/services/constants/app_str.dart';

class PickFoodImage extends StatelessWidget {
  final Function() onTap;
  File? file;
  PickFoodImage({super.key, required this.file, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: onTap,
      child: file != null
          ? Container(
              width: 327.w,
              height: 161.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: AppColors.ffD0DBEA, width: 3),
              ),
              child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(13.r),
                child: Image.file(
                  file!,
                  fit: BoxFit.cover,
                ),
              ))
          : Stack(
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 17.h,
                      ),
                      Image.asset(
                        AppIcons.uploadImage,
                        height: 60.h,
                        width: 60.w,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        AppStrings.addPhoto,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.ff3E5481),
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        AppStrings.upTo,
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.ff9FA5C0),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 327.w,
                  height: 161.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: AppColors.ffD0DBEA, width: 3),
                  ),
                ),
              ],
            ),
    );
  }
}
