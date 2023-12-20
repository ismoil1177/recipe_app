import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipe_app1/cubit/upload_cubit/upload_cubit.dart';
import 'package:recipe_app1/main.dart';
import 'package:recipe_app1/model/recipe_model.dart';

import 'package:recipe_app1/services/constants/app_color.dart';

import 'package:recipe_app1/services/constants/app_str.dart';
import 'package:recipe_app1/services/core/service_locator.dart';
import 'package:recipe_app1/view/upload/custom_user_text_field.dart';

class SecondPage extends StatefulWidget {
  Recipe recipe;
  SecondPage({super.key, required this.recipe});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final ImagePicker picker = ImagePicker();
  File? file;

  void getImage() async {
    final xFile = await picker.pickImage(source: ImageSource.gallery);
    file = xFile != null ? File(xFile.path) : null;

    if (file != null) {
      setState(() {});
    }
  }

  void saveRecipe() async {
    String name = widget.recipe.name;
    String description = widget.recipe.description;
    String photo = widget.recipe.imageUrl.toString();
    String ava = file!.path;
    double duration = widget.recipe.duration;
    String username = userNameController.value.text.trim();

    if (name.isEmpty ||
        description.isEmpty ||
        photo.isEmpty ||
        username.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please fill out all elements")));
      return;
    }
    final id = repository.readRecipe().length + 1;
    final recipe = Recipe(
        id: id,
        name: name,
        description: description,
        imageUrl: photo,
        duration: duration,
        username: username,
        userImageUrl: ava);

    final result = await repository.storeRecipe(recipe);
    if (result) {
      Navigator.pop(context, "done");
      Navigator.pop(context, "done");
    } else {
      ///error msg
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Some thing error, try again later")));
    }
  }

  final TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    uploadCubit.stream.listen((state) {
      /// listen
      if (uploadCubit.state is UploadFailure) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text((uploadCubit.state as UploadFailure).message)));
      }

      if (uploadCubit.state is UploadCreateSuccess) {
        Navigator.of(context).pop();
      }
    });

    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.infinity,
        leading: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24.sp),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Platform.isAndroid
                      ? Icons.arrow_back
                      : Icons.arrow_back_ios_new_outlined,
                  size: 22,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 24.sp),
              child: Center(
                child: RichText(
                    text: TextSpan(
                        text: "2/",
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
      body: Column(
        children: [
          Text(
            "User Photo",
            style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.ff3E5481),
          ),
          SizedBox(
            height: 10.sp,
          ),
          Center(
            child: InkWell(
              borderRadius: BorderRadius.circular(100.sp),
              onTap: getImage,
              child: file != null
                  ? Container(
                      width: 120.sp,
                      height: 120.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.sp),
                        border: Border.all(color: AppColors.ffD0DBEA, width: 3),
                      ),
                      child: ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.circular(100.sp),
                        child: Image.file(
                          file!,
                          fit: BoxFit.cover,
                        ),
                      ))
                  : Container(
                      width: 120.sp,
                      height: 120.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.sp),
                        border: Border.all(color: AppColors.ffD0DBEA, width: 3),
                      ),
                      child: Icon(Icons.photo),
                    ),
            ),
          ),
          SizedBox(
            height: 24.sp,
          ),
          Text(
            AppStrings.username,
            style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.ff3E5481),
          ),
          SizedBox(
            height: 10.sp,
          ),
          CustomUserTextField(
            controller: userNameController,
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          // saveRecipe();
          uploadCubit.create(
              widget.recipe.name,
              widget.recipe.description,
              widget.recipe.duration,
              widget.recipe.imageUrl.toString(),
              userNameController.value.text.trim(),
              file!.path);
        },
        child: Container(
          height: 56,
          width: 327,
          margin: EdgeInsets.only(right: 24.sp, left: 24.sp, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.sp),
              color: AppColors.ff1FCC79),
          child: Center(
            child: Text(
              AppStrings.done,
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
}
