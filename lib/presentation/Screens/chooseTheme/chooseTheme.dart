import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:team_quiz/config/contants/constants.dart';
import 'package:team_quiz/config/theme/theme.dart';
import 'package:team_quiz/presentation/CustomWidgets/custom_button.dart';
import 'package:team_quiz/presentation/Screens/chooseTheme/controllers/chooseTheme_controller.dart';
import 'package:team_quiz/presentation/Screens/setUpRound/setUpRound_screen.dart';

class ChooseThemeScreen extends StatelessWidget {
  const ChooseThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ChooseThemeController chooseThemeController =
        Get.put(ChooseThemeController());
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
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Text(
            'Choose themes',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: AppFonts.font40,
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: themes.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) => Obx(
                      () => GestureDetector(
                        onTap: () {
                          chooseThemeController.selectTheme(
                              name: themes[index]['name'],
                              id: themes[index]['id'],
                              list: themes[index]['list']);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: AppBorderRadius.borderRadius50,
                              color: AppColors.whiteColor,
                              border: Border.all(
                                  color: chooseThemeController.selectedThemeList
                                          .any((element) =>
                                              element['name'] ==
                                              themes[index]['name'])
                                      ? AppColors.blackColor
                                      : AppColors.greyColor,
                                  width: chooseThemeController.selectedThemeList
                                          .any((element) =>
                                              element['name'] ==
                                              themes[index]['name'])
                                      ? 5
                                      : 1),
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        AppColors.blackColor.withOpacity(0.25),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    blurStyle: BlurStyle.solid,
                                    offset: Offset(6, 11))
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                themes[index]['icon'],
                                colorFilter: ColorFilter.mode(
                                    AppColors.blackColor, BlendMode.srcIn),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                themes[index]['name'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: AppFonts.font20,
                                    color: AppColors.blackColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              text: 'Next Step',
              onTap: () {
                chooseThemeController.collectItemsFromSelectedThemes();
                chooseThemeController.selectedThemeList.isEmpty
                    ? Get.snackbar(
                        'Error',
                        'It is empty, please add a team',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      )
                    : Get.to(() => const SetUpRoundScreen());
              },
            ),
          )
        ],
      ),
    );
  }
}
