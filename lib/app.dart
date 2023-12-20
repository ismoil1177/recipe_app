import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:recipe_app1/pages/main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const ScreenUtilInit(
          designSize: Size(375, 812),
          splitScreenMode: true,
          minTextAdapt: true,
          child: MainPage()),
      debugShowCheckedModeBanner: false,
    );
  }
}
