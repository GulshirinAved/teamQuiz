import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team_quiz/config/contants/constants.dart';
import 'package:team_quiz/config/theme/theme.dart';
import 'package:team_quiz/presentation/CustomWidgets/custom_button.dart';
import 'package:team_quiz/presentation/Screens/chooseTheme/controllers/chooseTheme_controller.dart';
import 'package:team_quiz/presentation/Screens/divideTeam/controller/divideTeam_controller.dart';
import 'package:team_quiz/presentation/Screens/menu/controller/menu_controller.dart';
import 'package:team_quiz/presentation/Screens/quiz/controllers/audio_controller.dart';
import 'package:team_quiz/presentation/Screens/quiz/controllers/timer_controller.dart';
import 'package:team_quiz/presentation/Screens/result/result_screen.dart';
import 'package:team_quiz/presentation/Screens/setUpRound/controllers/setUpRound_controller.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late PageController _pageController;
  SetUpRoundController setUpRoundController = Get.put(SetUpRoundController());
  ChooseThemeController chooseThemeController =
      Get.put(ChooseThemeController());
  TimerController timerController = Get.put(TimerController());
  DivideTeamController divideTeamController = Get.put(DivideTeamController());
  AudioController audioController = Get.put(AudioController());
  MenusController menusController = Get.put(MenusController());
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    timerController
        .startTimer(int.parse(timeRound[setUpRoundController.timeValue.value]));
    chooseThemeController.scoreValue.value = 0;
    chooseThemeController.resultList.clear();
    audioController.onInit();
    if (menusController.switcherValue.value == true) {
      audioController.advancedPlayer?.play(AssetSource(audio),
          volume: 100,
          balance: 50.dg,
          mode: PlayerMode.mediaPlayer,
          position: Duration(
              seconds: int.parse(
                  scoreRound[setUpRoundController.scoreValue.value])));
    } else {
      audioController.advancedPlayer?.stop();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    audioController.onClose();
    super.dispose();
  }

  void nextPage() {
    if (_pageController.hasClients) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Obx(() => IconButton.filled(
              onPressed: () {
                if (timerController.play.value) {
                  timerController.stopTimer();
                } else {
                  timerController.resumeTimer();
                }
              },
              icon: Icon(
                timerController.play.value ? Icons.pause : Icons.play_arrow,
                color: AppColors.blackColor,
              ),
            )),
        title: Obx(
          () => Text(
            '${timerController.seconds.value} s',
            style: TextStyle(
                color: AppColors.whiteColor, fontSize: AppFonts.font30),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              top: 10.h,
              right: 5.w,
            ),
            child: Text(
              '${chooseThemeController.scoreValue.value}/${scoreRound[setUpRoundController.scoreValue.value]}',
              style: TextStyle(
                  color: AppColors.whiteColor, fontSize: AppFonts.font30),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200.h,
            width: Get.width,
            child: Obx(() {
              return PageView.builder(
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    setState(() {
                      currentIndex = value;
                    });
                  });
                },
                controller: _pageController,
                itemCount: chooseThemeController.collectedItems.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(
                        chooseThemeController.collectedItems[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: AppFonts.font55),
                      ),
                      Text(
                        'Category: ${chooseThemeController.selectedThemeList.firstWhere((theme) => theme['list'].contains(chooseThemeController.collectedItems[index]))['name']}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: AppFonts.font20),
                      ),
                    ],
                  );
                },
              );
            }),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8, left: 8, top: 300.h),
            child: Row(
              children: [
                Expanded(
                    child: CustomButton(
                        onTap: () {
                          if (timerController.seconds.value == 0 ||
                              chooseThemeController.scoreValue.value ==
                                  int.parse(scoreRound[
                                      setUpRoundController.scoreValue.value])) {
                            divideTeamController.addTeamScore(
                                score: chooseThemeController.scoreValue.value
                                    .toString());
                            Get.to(() => ResultScreen());
                          } else {
                            nextPage();
                            chooseThemeController.checking(
                                topTitle: chooseThemeController
                                    .collectedItems[currentIndex],
                                maxScore: int.parse(scoreRound[
                                    setUpRoundController.scoreValue.value]),
                                score: 0,
                                isSkip: true);
                          }
                        },
                        text: 'Skip')),
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                    child: CustomButton(
                        onTap: () {
                          if (timerController.seconds.value == 0 ||
                              chooseThemeController.scoreValue.value ==
                                  int.parse(scoreRound[
                                      setUpRoundController.scoreValue.value])) {
                            divideTeamController.addTeamScore(
                                score: chooseThemeController.scoreValue.value
                                    .toString());
                            Get.to(() => ResultScreen());
                          } else {
                            nextPage();
                            chooseThemeController.checking(
                                topTitle: chooseThemeController
                                    .collectedItems[currentIndex],
                                maxScore: int.parse(scoreRound[
                                    setUpRoundController.scoreValue.value]),
                                score: 3,
                                isSkip: false);
                          }
                        },
                        text: 'Guess')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
