import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team_quiz/config/theme/theme.dart';
import 'package:team_quiz/presentation/CustomWidgets/custom_button.dart';
import 'package:team_quiz/presentation/Screens/divideTeam/controller/divideTeam_controller.dart';
import 'package:team_quiz/presentation/Screens/menu/menu_screen.dart';
import 'package:team_quiz/presentation/Screens/quiz/quiz_screen.dart';

class Round1Screen extends StatelessWidget {
  const Round1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    DivideTeamController divideTeamController = Get.put(DivideTeamController());
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
          'Round 1',
          style: TextStyle(color: AppColors.whiteColor),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height - 30.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Obx(
                () => Text(divideTeamController.currentTurnIndex.value == -1
                    ? 'Team ${divideTeamController.getHighestScoreTeam()} win!'
                    : ''),
              ),
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: divideTeamController.teamList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        //letter image
                        Container(
                          height: 75.h,
                          width: 75.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: AppBorderRadius.borderRadius10,
                          ),
                          child: Text(
                            divideTeamController.teamList[index][0],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w700,
                              fontSize: AppFonts.font55,
                            ),
                          ),
                        ),
                        //name and amount players
                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                divideTeamController.teamList[index],
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: AppFonts.font20,
                                ),
                              ),
                              Text(
                                divideTeamController.currentTurnIndex.value ==
                                        index
                                    ? 'Your turn'
                                    : '',
                                style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize: AppFonts.font20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Text(
                          index < divideTeamController.teamScoreList.length
                              ? divideTeamController.teamScoreList[index]
                                  .toString()
                              : '0',
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppFonts.font20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              divideTeamController.currentTurnIndex.value != -1
                  ? Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: CustomButton(
                        text: 'Start',
                        onTap: () {
                          divideTeamController.nextTurn();
                          Get.to(() => const QuizScreen());
                        },
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          MaterialButton(
                            height: 45.h,
                            shape: RoundedRectangleBorder(
                                borderRadius: AppBorderRadius.borderRadius20),
                            color: AppColors.whiteColor,
                            onPressed: () {
                              Get.back();
                            },
                            child: const Icon(Icons.fast_rewind),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                              child: CustomButton(
                                  onTap: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) => MenuScreen()),
                                        (route) => false);
                                  },
                                  text: 'Restart'))
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
