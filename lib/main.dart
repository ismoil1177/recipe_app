import 'package:flutter/material.dart';
import 'package:recipe_app1/app.dart';
import 'package:recipe_app1/cubit/main_cubit/main_cubit.dart';
import 'package:recipe_app1/cubit/upload_cubit/upload_cubit.dart';
import 'package:recipe_app1/services/core/service_locator.dart';

//sevice locator
final mainCubit = MainCubit();
final uploadCubit = UploadCubit();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocator();

  runApp(const MyApp());
}
