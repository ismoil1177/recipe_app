import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app1/cubit/main_cubit/main_cubit.dart';
import 'package:recipe_app1/cubit/upload_cubit/upload_cubit.dart';
import 'package:recipe_app1/main.dart';

import 'package:recipe_app1/pages/upload_page.dart';
import 'package:recipe_app1/pages/detail_page.dart';
import 'package:recipe_app1/services/constants/app_color.dart';
import 'package:recipe_app1/services/constants/app_icons.dart';
import 'package:recipe_app1/services/constants/app_str.dart';

import 'package:recipe_app1/view/main/custom_bottom_navigation.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    mainCubit.fetchRecipes();
    uploadCubit.stream.listen((state) {
      if (state is UploadCreateSuccess) {
        mainCubit.fetchRecipes();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        actions: [
          Container(
            height: 56.h,
            width: 231.w,
            decoration: BoxDecoration(
              color: AppColors.f4F5F7,
              borderRadius: BorderRadius.circular(32.r),
            ),
            child: TextField(
              decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(
                        left: 24.w, top: 16.h, bottom: 16.h, right: 16.w),
                    child: Image.asset(AppIcons.cancel),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                        left: 24.w, top: 16.h, bottom: 16.h, right: 16.w),
                    child: Image.asset(
                      AppIcons.search,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.r),
                      borderSide: BorderSide.none)),
            ),
          ),
          SizedBox(
            width: 24.w,
          ),
          Image.asset(
            AppIcons.filter,
            height: 24.h,
            width: 24.w,
          ),
          SizedBox(
            width: 24.w,
          ),
        ],
      ),
      body: BlocBuilder<MainCubit, MainState>(
          bloc: mainCubit,
          builder: (context, state) {
            final recipes = state.recipe;

            return GridView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: recipes.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 20.w,
                    mainAxisExtent: 264.h,
                    crossAxisCount: 2),
                itemBuilder: (_, index) {
                  final recipe = recipes[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(recipe: recipe)));
                    },
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 31.h,
                                  width: 34.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(11.r),
                                    child: Image.file(
                                      File(recipe.userImageUrl!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  recipe.username!,
                                  style: TextStyle(
                                      letterSpacing: 0.5,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.ff2E3E5C),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            SizedBox(
                              width: 151.w,
                              height: 151.h,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.r),
                                child: Image.file(
                                  File(recipe.imageUrl!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Text(
                              recipe.name,
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  letterSpacing: 0.5.w,
                                  color: AppColors.ff335481),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  AppStrings.food,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.5.w,
                                      color: AppColors.ff9FA5C0),
                                ),
                                SizedBox(
                                  width: 8.h,
                                ),
                                Image.asset(
                                  AppIcons.dot,
                                  height: 5.h,
                                  width: 5.w,
                                ),
                                SizedBox(
                                  width: 8.h,
                                ),
                                Text(
                                  recipe.duration == 35
                                      ? "30 mins"
                                      : (recipe.duration == 60
                                          ? ">${recipe.duration.toInt().toString()} mins"
                                          : "<10 mins"),
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.ff9FA5C0),
                                ),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {});
                              if (recipe.isLiked == false) {
                                recipe.isLiked = true;
                              } else {
                                recipe.isLiked = false;
                              }
                            },
                            child: Container(
                                margin: EdgeInsets.only(top: 63.h, left: 103.w),
                                height: 32.h,
                                width: 32.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: const Color(0x33FFFFFF)
                                        .withOpacity(0.2)),
                                child: recipe.isLiked == true
                                    ? const Center(
                                        child: Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                      )
                                    : const Center(
                                        child: Icon(
                                          Icons.favorite_outline,
                                          color: AppColors.ffffff,
                                        ),
                                      )))
                      ],
                    ),
                  );
                });
          }),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        height: 95.h,
        width: 375.w,
        decoration: BoxDecoration(color: AppColors.ffffff),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustombottomNavigatoinBarItem(
                image: AppIcons.home, text: "Home", color: AppColors.ff1FCC79),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const CreatRecipe()));
              },
              child: CustombottomNavigatoinBarItem(
                  image: AppIcons.upload,
                  text: "Upload",
                  color: AppColors.ff9FA5C0),
            ),
            CustombottomNavigatoinBarItem(
                image: AppIcons.scan, text: "Scan", color: AppColors.ff9FA5C0),
            CustombottomNavigatoinBarItem(
                image: AppIcons.notif,
                text: "Notification",
                color: AppColors.ff9FA5C0),
            CustombottomNavigatoinBarItem(
                image: AppIcons.profile,
                text: "Profile",
                color: AppColors.ff9FA5C0)
          ],
        ),
      ),
    );
  }
}
