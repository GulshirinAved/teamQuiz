import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class TimerController extends GetxController {
  RxInt seconds = 0.obs;
  RxBool play = false.obs;
  Timer? timer;

  void startTimer(int duration) {
    if (!play.value) {
      seconds.value = duration;
    }
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value--;
        play.value = true;
      } else {
        timer.cancel();
        play.value = false;
      }
    });
  }

  void resumeTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value--;
        play.value = true;
      } else {
        timer.cancel();
        play.value = false;
      }
    });
  }

  void stopTimer() {
    timer?.cancel();
    play.value = false;
  }

  @override
  void onClose() {
    timer?.cancel();
    play.value = false;
    super.onClose();
  }
}
