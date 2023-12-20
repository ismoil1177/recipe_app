import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import 'package:recipe_app1/model/recipe_model.dart';
import 'package:recipe_app1/pages/second_page.dart';
import 'package:recipe_app1/services/constants/app_color.dart';

import 'package:recipe_app1/services/constants/app_str.dart';
import 'package:recipe_app1/services/core/service_locator.dart';
import 'package:recipe_app1/view/upload/custom_food_txt_field.dart';
import 'package:recipe_app1/view/upload/pick_food_image.dart';

class CreatRecipe extends StatefulWidget {
  const CreatRecipe({super.key});

  @override
  State<CreatRecipe> createState() => _CreatRecipeState();
}

class _CreatRecipeState extends State<CreatRecipe> {
  double _value = 10;

  final ImagePicker picker = ImagePicker();
  File? file;

  void getImage() async {
    final xFile = await picker.pickImage(source: ImageSource.gallery);
    file = xFile != null ? File(xFile.path) : null;

    if (file != null) {
      setState(() {});
    }
  }

  final TextEditingController nameController = TextEditingController();

  final TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leadingWidth: double.infinity,
        leading: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  AppStrings.cancel,
                  style: TextStyle(
                      fontSize: 17.w,
                      fontWeight: FontWeight.w700,
                      color: AppColors.ffFF6464),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 24.w),
              child: Center(
                child: RichText(
                    text: TextSpan(
                        text: "1/",
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.ff3E5481),
                        children: [
                      TextSpan(
                        text: "2",
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.ff9FA5C0),
                      )
                    ])),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            PickFoodImage(file: file, onTap: getImage),
            SizedBox(
              height: 20.h,
            ),
            Text(
              AppStrings.foodName,
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.ff3E5481),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomFoodNameTextField(
              controller: nameController,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              AppStrings.desc,
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.ff3E5481),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 80.h,
              width: 327.w,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.ff9FA5C0),
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
              ),
              child: TextField(
                style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.ff9FA5C0,
                    fontWeight: FontWeight.w500),
                maxLines: null,
                controller: descController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 8.sp),
                  border: InputBorder.none,
                  hintText: AppStrings.aboutFood,
                  hintStyle: TextStyle(
                      fontSize: 13.w,
                      fontWeight: FontWeight.w500,
                      color: AppColors.ff9FA5C0),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Text(
                  AppStrings.cookingDur,
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.ff3E5481),
                ),
                Text(
                  " (in minutes)",
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.ff9FA5C0),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(3, (index) {
                      return Text(
                          index == 2 ? ">60" : (index == 1 ? "30" : "<10"),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: index == 1 && _value > 10 || index == 0
                                      ? (AppColors.ff1FCC79)
                                      : (index == 2 && _value > 35
                                          ? AppColors.ff1FCC79
                                          : AppColors.ff9FA5C0)));
                    }),
                  ),
                ),
                Slider(
                  value: _value,
                  thumbColor: AppColors.ff1FCC79,
                  activeColor: AppColors.ff1FCC79,
                  inactiveColor: AppColors.f4F5F7,
                  min: 10,
                  max: 60,
                  divisions: 2,
                  onChanged: (double newValue) {
                    setState(() {
                      _value = newValue;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          String name = nameController.value.text.trim();
          String description = descController.value.text.trim();
          String photo = file!.path;

          if (name.isNotEmpty || description.isNotEmpty || photo.isNotEmpty) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SecondPage(
                          recipe: Recipe(
                              id: repository.readRecipe().length + 1,
                              name: nameController.value.text.trim(),
                              description: descController.value.text.trim(),
                              duration: _value,
                              imageUrl: file!.path),
                        )));
            return;
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Please fill out all elements")));
            return;
          }
        },
        child: Container(
          height: 56,
          width: 327,
          margin: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 20.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.r),
              color: AppColors.ff1FCC79),
          child: Center(
            child: Text(
              AppStrings.next,
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.ffffff),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    descController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
