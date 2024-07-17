import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team_quiz/presentation/CustomWidgets/custom_button.dart';
import 'package:team_quiz/presentation/Screens/result/result_screen.dart';

class FinishQuizScreen extends StatelessWidget {
  const FinishQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                onTap: () {
                  Get.to(() => ResultScreen());
                },
                text: 'Play'),
            SizedBox(
              height: 30.h,
            ),
            CustomButton(
                onTap: () {
                  Get.to(() => ResultScreen());
                },
                text: 'Menu'),
          ],
        ),
      ),
    );
  }
}
