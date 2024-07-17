import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team_quiz/config/theme/theme.dart';
import 'package:team_quiz/presentation/CustomWidgets/custom_button.dart';
import 'package:team_quiz/presentation/Screens/amountPlayer/controllers/amountPlayers_controller.dart';
import 'package:team_quiz/presentation/Screens/divideTeam/divideTeam_screen.dart';

class AmountPlayerScreen extends StatelessWidget {
  const AmountPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AmountplayersController amountplayersController =
        Get.put(AmountplayersController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: AppColors.whiteColor,
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.fast_rewind_sharp,
            color: AppColors.blackColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'How many players will there be?',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: AppFonts.font40,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              height: 345.h,
              width: Get.width,
              margin: EdgeInsets.symmetric(vertical: 10.h),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: AppBorderRadius.borderRadius20,
              ),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: ListView.builder(
                itemCount: 20,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => amountplayersController.selectAmaunt(index),
                  child: Obx(
                    () => Text(
                      '${index + 1}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: amountplayersController.selectAmount.value ==
                                  index
                              ? AppColors.blackColor
                              : AppColors.greyColor,
                          fontSize:
                              amountplayersController.selectAmount.value ==
                                      index
                                  ? AppFonts.font55
                                  : AppFonts.font40),
                    ),
                  ),
                ),
              ),
            ),
            CustomButton(
              text: 'Next Step',
              onTap: () => Get.to(() => DivideTeamScreen(
                    amountPlayer:
                        amountplayersController.selectAmount.value + 1,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
