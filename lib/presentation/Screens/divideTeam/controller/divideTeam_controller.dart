import 'package:get/get.dart';

class DivideTeamController extends GetxController {
  RxList teamList = ['Sharks', 'Lions'].obs;
  RxInt currentTurnIndex = 0.obs;
  RxList teamScoreList = [].obs;
  void addTeam({required String name}) {
    if (name != '') {
      teamList.add(name);
    }
  }

  void removeTeam({required String name}) {
    teamList.remove(name);
  }

  void updateTeam({required String oldName, required String newName}) {
    int index = teamList.indexOf(oldName);
    if (index != -1 && newName.isNotEmpty) {
      teamList[index] = newName;
    }
  }

  void nextTurn() {
    currentTurnIndex.value = (currentTurnIndex.value + 1) % teamList.length;
    currentTurnIndex.value <= 0
        ? currentTurnIndex.value = -1
        : currentTurnIndex.value;
  }

  void addTeamScore({required String score}) {
    teamScoreList.add(int.parse(score));
  }

  String getHighestScoreTeam() {
    int highestScore = teamScoreList.reduce((a, b) => a >= b ? a : b);
    int index = teamScoreList.indexOf(highestScore);
    return teamList[index];
  }
}
