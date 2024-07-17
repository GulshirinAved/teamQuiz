import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_quiz/config/theme/theme.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double? width;
  const CustomButton(
      {super.key, required this.onTap, required this.text, this.width});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      minWidth: width ?? Get.width,
      color: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderRadius.borderRadius20,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.blackColor,
          fontSize: AppFonts.font40,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
