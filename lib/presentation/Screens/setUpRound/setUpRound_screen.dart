import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team_quiz/config/contants/constants.dart';
import 'package:team_quiz/config/theme/theme.dart';
import 'package:team_quiz/presentation/CustomWidgets/custom_button.dart';
import 'package:team_quiz/presentation/Screens/round1/round1_screen.dart';
import 'package:team_quiz/presentation/Screens/setUpRound/components/round_card.dart';
import 'package:team_quiz/presentation/Screens/setUpRound/controllers/setUpRound_controller.dart';

class SetUpRoundScreen extends StatelessWidget {
  const SetUpRoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SetUpRoundController setUpRoundController = Get.put(SetUpRoundController());
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
      ),
      body: Column(
        children: [
          Text(
            'Set up the round',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: AppFonts.font40,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            children: List.generate(
              timeRound.length,
              (index) => Obx(
                () => RoundCard(
                  text: '${timeRound[index]}s',
                  onTap: () {
                    setUpRoundController.selectTime(index);
                  },
                  borderColor: setUpRoundController.timeValue == index
                      ? AppColors.blackColor
                      : AppColors.whiteColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Score for winning',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: AppFonts.font40,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            children: List.generate(
              scoreRound.length,
              (index) => Obx(
                () => RoundCard(
                  text: scoreRound[index],
                  onTap: () {
                    setUpRoundController.selectScore(index);
                  },
                  borderColor: setUpRoundController.scoreValue == index
                      ? AppColors.blackColor
                      : AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.only(top: 280.h, left: 10.w, right: 10.w),
        child: CustomButton(
          text: 'Next Step',
          onTap: () {
            Get.to(() => const Round1Screen());
          },
        ),
      ),
    );
  }
}
