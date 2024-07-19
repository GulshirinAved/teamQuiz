import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

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
    if (teamScoreList.isEmpty) {
      return '';
    } else {
      int highestScore = teamScoreList.reduce((a, b) => a >= b ? a : b);
      List<String> highestScoringTeams = [];
      for (int i = 0; i < teamScoreList.length; i++) {
        if (teamScoreList[i] == highestScore) {
          highestScoringTeams.add(teamList[i]);
        }
      }
      return highestScoringTeams.join(', ');
    }
  }
}
