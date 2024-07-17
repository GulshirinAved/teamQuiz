import 'package:get/get.dart';

class MenusController extends GetxController {
  RxBool switcherValue = false.obs;
  void switcherChange(bool switcher) {
    switcherValue.value = switcher;
  }
}
