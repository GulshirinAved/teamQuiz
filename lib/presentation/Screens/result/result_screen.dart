import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_quiz/config/theme/theme.dart';
import 'package:team_quiz/presentation/CustomWidgets/custom_button.dart';
import 'package:team_quiz/presentation/Screens/chooseTheme/controllers/chooseTheme_controller.dart';
import 'package:team_quiz/presentation/Screens/round1/round1_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ChooseThemeController chooseThemeController =
        Get.put(ChooseThemeController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Results',
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppFonts.font30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: List.generate(
                chooseThemeController.resultList.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        chooseThemeController.resultList[index]['topTitle'],
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppFonts.font20),
                      ),
                      Icon(
                        chooseThemeController.resultList[index]['isSkip']
                            ? Icons.close
                            : Icons.check_circle,
                        color: chooseThemeController.resultList[index]['isSkip']
                            ? AppColors.whiteColor
                            : AppColors.greenColor,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomButton(
            onTap: () {
              Get.to(() => Round1Screen());
            },
            text: 'Continue'),
      ),
    );
  }
}
