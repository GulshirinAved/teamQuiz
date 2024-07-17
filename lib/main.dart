import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team_quiz/config/contants/constants.dart';
import 'package:team_quiz/config/theme/theme.dart';
import 'package:team_quiz/presentation/Screens/menu/menu_screen.dart';

void main() {
  runApp(ScreenUtilInit(
    designSize: const Size(360, 690),
    minTextAdapt: true,
    builder: (context, child) => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Team Quiz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        scaffoldBackgroundColor: AppColors.redColor,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.redColor,
          elevation: 0,
        ),
        fontFamily: fontLibre,
        useMaterial3: false,
      ),
      defaultTransition: Transition.fade,
      home: const MenuScreen(),
    ),
  ));
}
