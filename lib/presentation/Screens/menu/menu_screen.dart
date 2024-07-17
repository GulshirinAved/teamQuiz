import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_quiz/config/theme/theme.dart';
import 'package:team_quiz/presentation/Screens/amountPlayer/amountPlayer_screen.dart';
import 'package:team_quiz/presentation/Screens/menu/components/menu_card.dart';
import 'package:team_quiz/presentation/Screens/menu/rules_screen.dart';
import 'package:team_quiz/presentation/Screens/menu/settings_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => Rules());
              },
              icon: Icon(
                Icons.error,
                color: AppColors.whiteColor,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 8),
        child: Column(
          children: [
            MenuCard(
              title: 'Play',
              onTap: () {
                Get.to(() => const AmountPlayerScreen());
              },
            ),
            MenuCard(
              title: 'Settings',
              onTap: () {
                Get.to(() => const SettingScreen());
              },
              paddingSize: 0,
            )
          ],
        ),
      ),
    );
  }
}
