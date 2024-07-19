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
  MenusController menusController = Get.put(MenusController());
  int currentIndex = 0;
  late AudioPlayer advancedPlayer;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    advancedPlayer = AudioPlayer();

    // Start the timer
    timerController
        .startTimer(int.parse(timeRound[setUpRoundController.timeValue.value]));
    chooseThemeController.scoreValue.value = 0;
    chooseThemeController.resultList.clear();

    // Play or stop audio based on switcherValue
    if (menusController.switcherValue.value) {
      advancedPlayer.play(AssetSource('audio/audio.mp3'));
    } else {
      advancedPlayer.stop();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    timerController.onClose();
    advancedPlayer.dispose();
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
    return WillPopScope(
      onWillPop: () async {
        await advancedPlayer.stop();
        chooseThemeController.scoreValue.value = 0;
        chooseThemeController.resultList.clear();
        return true;
      },
      child: Scaffold(
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
                    final item = chooseThemeController.collectedItems[index];
                    final theme =
                        chooseThemeController.selectedThemeList.firstWhere(
                      (theme) => theme['list'].contains(item),
                      orElse: () => {},
                    );

                    return Column(
                      children: [
                        Text(
                          item,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: AppFonts.font55,
                          ),
                        ),
                        if (theme != null)
                          Text(
                            'Category: ${theme['name']}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: AppFonts.font20,
                            ),
                          ),
                      ],
                    );
                  },
                );
              }),
            ),
          ],
        ),
        bottomSheet: Padding(
          padding: EdgeInsets.all(8),
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
                        score:
                            chooseThemeController.scoreValue.value.toString(),
                      );
                      advancedPlayer.stop();
                      Get.to(() => ResultScreen());
                    } else {
                      nextPage();
                      chooseThemeController.checking(
                        topTitle:
                            chooseThemeController.collectedItems[currentIndex],
                        maxScore: int.parse(
                          scoreRound[setUpRoundController.scoreValue.value],
                        ),
                        score: 0,
                        isSkip: true,
                      );
                    }
                  },
                  text: 'Skip',
                ),
              ),
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
                        score:
                            chooseThemeController.scoreValue.value.toString(),
                      );
                      advancedPlayer.stop();
                      Get.to(() => ResultScreen());
                    } else {
                      nextPage();
                      chooseThemeController.checking(
                        topTitle:
                            chooseThemeController.collectedItems[currentIndex],
                        maxScore: int.parse(
                          scoreRound[setUpRoundController.scoreValue.value],
                        ),
                        score: 2,
                        isSkip: false,
                      );
                    }
                  },
                  text: 'Guess',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
