import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team_quiz/config/theme/theme.dart';
import 'package:team_quiz/presentation/CustomWidgets/custom_button.dart';
import 'package:team_quiz/presentation/Screens/chooseTheme/chooseTheme.dart';
import 'package:team_quiz/presentation/Screens/divideTeam/components/playersInfo_tile.dart';
import 'package:team_quiz/presentation/Screens/divideTeam/controller/divideTeam_controller.dart';

class DivideTeamScreen extends StatefulWidget {
  final int amountPlayer;
  const DivideTeamScreen({super.key, required this.amountPlayer});

  @override
  State<DivideTeamScreen> createState() => _DivideTeamScreenState();
}

class _DivideTeamScreenState extends State<DivideTeamScreen> {
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
//description
              Text(
                'Divide into teams',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: AppFonts.font40,
                  fontWeight: FontWeight.w400,
                ),
              ),
//tiles
              Obx(() => ListView.builder(
                    shrinkWrap: true,
                    itemCount: divideTeamController.teamList.length,
                    itemBuilder: (context, index) {
                      return PlayerInfoTile(
                        name: divideTeamController.teamList[index],
                        amountPlayer: widget.amountPlayer,
                        onEdit: () {
                          nameController.text =
                              divideTeamController.teamList[index];
                          bottomsheet(context, nameController, () {
                            divideTeamController.updateTeam(
                              oldName: divideTeamController.teamList[index],
                              newName: nameController.text,
                            );
                            Get.back();
                          });
                        },
                      );
                    },
                  )),
              Padding(
                padding: EdgeInsets.only(top: 170.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          width: 50.w,
                          onTap: () {
                            if (divideTeamController.teamList.isNotEmpty) {
                              divideTeamController.removeTeam(
                                name: divideTeamController.teamList.last,
                              );
                            }
                          },
                          text: '-',
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        CustomButton(
                          width: 50.w,
                          onTap: () {
                            bottomsheet(context, nameController, () {
                              divideTeamController.addTeam(
                                name: nameController.text,
                              );
                              Get.back();
                            });
                          },
                          text: '+',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomButton(
                      text: 'Next Step',
                      onTap: () {
                        divideTeamController.teamList.isEmpty
                            ? Get.snackbar(
                                'Error',
                                'It is empty, please add a team',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              )
                            : Get.to(() => const ChooseThemeScreen());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> bottomsheet(BuildContext context,
      TextEditingController controller, VoidCallback onTap) {
    return showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Write Name of Team',
                  hintStyle: TextStyle(
                    color: AppColors.greyColor.withOpacity(0.4),
                    fontWeight: FontWeight.w400,
                  ),
                  fillColor: AppColors.greyColor.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: AppBorderRadius.borderRadius20,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: AppBorderRadius.borderRadius20,
                    borderSide: BorderSide(color: AppColors.redColor),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                elevation: const WidgetStatePropertyAll(1),
                side: WidgetStatePropertyAll(
                  BorderSide(color: AppColors.blackColor),
                ),
                fixedSize: WidgetStatePropertyAll(
                  Size.fromWidth(Get.width - 10),
                ),
                backgroundColor: WidgetStatePropertyAll(AppColors.whiteColor),
              ),
              onPressed: onTap,
              child: Text(
                'Save',
                style: TextStyle(color: AppColors.blackColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
