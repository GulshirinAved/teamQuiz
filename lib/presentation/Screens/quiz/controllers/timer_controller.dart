import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class TimerController extends GetxController {
  RxInt seconds = 0.obs;
  RxBool play = false.obs;
  Timer? timer;

  void startTimer(int duration) {
    if (timer?.isActive ?? false)
      return; // Prevent starting a new timer if one is already active
    seconds.value = duration;
    play.value = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value--;
      } else {
        timer.cancel();
        play.value = false;
      }
    });
  }

  void resumeTimer() {
    if (timer?.isActive ?? false)
      return; // Prevent resuming a new timer if one is already active
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
    timer = null;
    play.value = false;
  }

  void resetTimer(int duration) {
    stopTimer();
    startTimer(duration);
  }

  @override
  void onClose() {
    stopTimer();
    super.onClose();
  }
}
