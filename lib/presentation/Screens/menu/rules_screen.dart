import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team_quiz/config/theme/theme.dart';

class Rules extends StatelessWidget {
  const Rules({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton.filled(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.fast_rewind_sharp,
            color: AppColors.blackColor,
          ),
        ),
        title: Text(
          'Rules',
          style:
              TextStyle(color: AppColors.whiteColor, fontSize: AppFonts.font40),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0).copyWith(top: 50.h),
        child: Container(
          margin: EdgeInsets.only(right: 10, left: 10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: AppBorderRadius.borderRadius20,
          ),
          child: Text(
            'You have to divide into teams and try to describe the words on the screen to your team on time.\nPress GUESS if your team guessed the word right and press SKIP if they can’t.\nWin that team who first collect all points.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: AppFonts.font30),
          ),
        ),
      ),
    );
  }
}
