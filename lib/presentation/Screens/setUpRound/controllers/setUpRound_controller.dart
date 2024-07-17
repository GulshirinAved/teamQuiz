import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class SetUpRoundController extends GetxController {
  RxInt timeValue = 0.obs;
  RxInt scoreValue = 0.obs;
  void selectTime(int index) {
    timeValue.value = index;
  }

  void selectScore(int index) {
    scoreValue.value = index;
  }
}
