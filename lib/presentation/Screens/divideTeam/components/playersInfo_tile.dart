// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:team_quiz/config/theme/theme.dart';

class PlayerInfoTile extends StatelessWidget {
  final int amountPlayer;
  final String name;
  final VoidCallback onEdit;
  const PlayerInfoTile({
    Key? key,
    required this.amountPlayer,
    required this.name,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              name[0].toUpperCase(),
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
                  name,
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: AppFonts.font20,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      amountPlayer.toString(),
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: AppFonts.font15,
                      ),
                    ),
                    Icon(Icons.accessibility_sharp),
                  ],
                )
              ],
            ),
          ),
          Spacer(),
          IconButton(
              onPressed: onEdit,
              icon: Icon(
                CupertinoIcons.pencil,
                color: AppColors.whiteColor,
              ))
        ],
      ),
    );
  }
}
