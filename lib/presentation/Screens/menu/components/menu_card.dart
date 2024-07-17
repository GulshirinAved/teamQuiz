import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team_quiz/config/theme/theme.dart';

class MenuCard extends StatelessWidget {
  final String title;
  final double? paddingSize;
  final VoidCallback? onTap;
  const MenuCard({
    required this.title,
    this.paddingSize,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Padding(
        padding: EdgeInsets.only(right: paddingSize ?? 30),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 197.h,
              width: 364.w,
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomRight: Radius.circular(100))),
            ),
            Container(
              height: 100.h,
              width: 364.w,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 50),
              decoration: BoxDecoration(
                  color: AppColors.redColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: AppFonts.font55,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
