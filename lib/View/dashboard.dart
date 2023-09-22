import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music/Controller.dart/home_controller.dart';
import 'package:music/Utils/text.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: textBlack25w600('Music')),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics
        (),
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: GetBuilder<HomeController>(
          builder: (controller) {
            return textBlack25w600('justaudio background package');
          },
        ),
      ),
    );
  }
}
