import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team_quiz/config/theme/theme.dart';
import 'package:team_quiz/presentation/Screens/menu/controller/menu_controller.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MenusController menuController = Get.put(
      MenusController(),
      permanent: true,
    );
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
          'Settings',
          style:
              TextStyle(color: AppColors.whiteColor, fontSize: AppFonts.font40),
        ),
      ),
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: AppBorderRadius.borderRadius10),
              child: Obx(
                () => SwitchListTile(
                  value: menuController.switcherValue.value,
                  onChanged: (value) {
                    menuController.switcherChange(value);
                  },
                  title: Text(
                    'Sound',
                    style: TextStyle(
                        color: AppColors.blackColor, fontSize: AppFonts.font30),
                  ),
                ),
              )),
          Container(
            width: Get.width,
            height: 76.h,
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: AppBorderRadius.borderRadius10),
            child: Text(
              'Privacy policy',
              style: TextStyle(
                  color: AppColors.blackColor, fontSize: AppFonts.font30),
            ),
          )
        ],
      ),
    );
  }
}
