// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:team_quiz/config/theme/theme.dart';

class RoundCard extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color borderColor;
  const RoundCard(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: AppBorderRadius.borderRadius20,
            color: AppColors.whiteColor,
            border: Border.all(color: borderColor, width: 3)),
        child: Text(
          text,
          style:
              TextStyle(color: AppColors.blackColor, fontSize: AppFonts.font20),
        ),
      ),
    );
  }
}
