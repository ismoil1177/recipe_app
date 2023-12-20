
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app1/model/recipe_model.dart';
import 'package:recipe_app1/services/constants/app_color.dart';
import 'package:recipe_app1/services/constants/app_icons.dart';
import 'package:recipe_app1/services/constants/app_str.dart';

class DetailPage extends StatefulWidget {
  Recipe recipe;
  DetailPage({super.key, required this.recipe});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.file(
                File(widget.recipe.imageUrl!),
                height: 330.h,
                width: 375.w,
                fit: BoxFit.cover,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 40.h, left: 20.w),
                  child: Container(
                    height: 50.h,
                    width: 50.w,
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0x33FFFFFF).withOpacity(0.2),
                    ),
                    child: Image.asset(
                      AppIcons.arrow,
                      color: AppColors.ffffff,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 300.h),
                height: 512.h,
                width: 375.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.r),
                      topRight: Radius.circular(32.r)),
                  color: AppColors.ffffff,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 16.h,
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        height: 5.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: AppColors.ffD0DBEA,
                            borderRadius: BorderRadius.circular(32.r)),
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.recipe.name,
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.ff3E5481),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          Text(
                            AppStrings.food,
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5.w,
                                color: AppColors.ff9FA5C0),
                          ),
                          SizedBox(
                            width: 8.h,
                          ),
                          Text(
                            widget.recipe.duration == 35
                                ? "30 mins"
                                : "${widget.recipe.duration.toInt().toString()} mins",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.ff9FA5C0,
                                letterSpacing: 0.5),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 37.h,
                            width: 40.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100.r),
                              child: Image.file(
                                File(widget.recipe.userImageUrl!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            widget.recipe.username!,
                            style: TextStyle(
                                letterSpacing: 0.5,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.ff3E5481),
                          ),
                          const Spacer(),
                          Container(
                            height: 37.h,
                            width: 40.w,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.ff1FCC79),
                            child: Center(
                                child: Image.asset(
                              AppIcons.fav,
                              height: 23.h,
                              width: 23.w,
                            )),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            widget.recipe.isLiked == true
                                ? "1 Likes"
                                : "0 Likes",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.ff3E5481,
                                letterSpacing: 0.5),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Container(
                        height: 1.5.h,
                        width: 327.w,
                        decoration:
                            const BoxDecoration(color: AppColors.ffD0DBEA),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            AppStrings.desc,
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.ff335481,
                                letterSpacing: 0.5),
                          )),
                      SizedBox(
                        height: 8.h,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.recipe.description,
                          style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.ff9FA5C0),
                        ),
                      ),
                      SizedBox(
                        height: 16.sp,
                      ),
                      Container(
                        height: 1.5.h,
                        width: 327.w,
                        decoration:
                            const BoxDecoration(color: AppColors.ffD0DBEA),
                      ),
                      SizedBox(
                        height: 16.sp,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Ingredients",
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.ff335481,
                                letterSpacing: 0.5),
                          )),
                      SizedBox(
                        height: 16.sp,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30.h,
                            width: 30.w,
                            padding: EdgeInsets.symmetric(
                                horizontal: 7.w, vertical: 7.h),
                            decoration: const BoxDecoration(
                                color: AppColors.ff33fff8,
                                shape: BoxShape.circle),
                            child: Image.asset(
                              AppIcons.check,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Text(
                            "4 Eggs",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: AppColors.ff2E3E5C,
                                letterSpacing: 0.5),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 13.sp,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30.h,
                            width: 30.w,
                            padding: EdgeInsets.symmetric(
                                horizontal: 7.w, vertical: 7.h),
                            decoration: const BoxDecoration(
                                color: AppColors.ff33fff8,
                                shape: BoxShape.circle),
                            child: Image.asset(
                              AppIcons.check,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Text(
                            "1/2 Butter",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: AppColors.ff2E3E5C,
                                letterSpacing: 0.5),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 13.sp,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30.h,
                            width: 30.w,
                            padding: EdgeInsets.symmetric(
                                horizontal: 7.w, vertical: 7.h),
                            decoration: const BoxDecoration(
                                color: AppColors.ff33fff8,
                                shape: BoxShape.circle),
                            child: Image.asset(
                              AppIcons.check,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Text(
                            "1/2 Butter",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: AppColors.ff2E3E5C,
                                letterSpacing: 0.5),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
