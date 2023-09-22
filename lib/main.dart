import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music/Routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) {
          return GetMaterialApp(
              title: 'Music App',
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              getPages: AppRoutes.appRoutes());
        },
        designSize: const Size(360, 800));
  }
}
