import 'package:get/get.dart';
import 'package:team_quiz/config/contants/catalog.dart';

class ChooseThemeController extends GetxController {
  RxList<Map<String, dynamic>> selectedThemeList = <Map<String, dynamic>>[].obs;
  RxList<String> collectedItems = <String>[].obs;
  RxList<Map<String, dynamic>> resultList = <Map<String, dynamic>>[].obs;
  RxInt scoreValue = 0.obs;

  void selectTheme(
      {required String name, required String id, required List<String> list}) {
    var theme = {'name': name, 'id': id, 'list': list};
    if (selectedThemeList.any((element) => element['name'] == name)) {
      selectedThemeList.removeWhere((element) => element['name'] == name);
    } else {
      selectedThemeList.add(theme);
    }
    collectItemsFromSelectedThemes();
  }

  void collectItemsFromSelectedThemes() {
    collectedItems.clear();
    for (var theme in selectedThemeList) {
      if (categories.containsKey(theme['id'])) {
        collectedItems.addAll(theme['list']);
      }
    }
    collectedItems.shuffle();
    print('Collected Items: $collectedItems');
  }

  void checking(
      {required String topTitle,
      required bool isSkip,
      required int score,
      required int maxScore}) {
    resultList.add({
      'topTitle': topTitle,
      'isSkip': isSkip,
      'score': scoreValue < maxScore ? scoreValue + score : maxScore
    });
  }
}
