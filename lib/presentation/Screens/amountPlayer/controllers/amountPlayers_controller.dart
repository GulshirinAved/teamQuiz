import 'package:get/get.dart';

class AmountplayersController extends GetxController {
  RxInt selectAmount = 0.obs;
  void selectAmaunt(int index) {
    selectAmount.value = index;
  }
}
