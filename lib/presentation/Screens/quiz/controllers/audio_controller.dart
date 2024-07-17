import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class AudioController extends GetxController {
  AudioPlayer? advancedPlayer;
  AudioCache? audioCache;

  void initPlayer() {
    advancedPlayer = AudioPlayer();
    audioCache = AudioCache(prefix: 'assets/audio/');
  }

  @override
  void onInit() {
    super.onInit();
    initPlayer();
  }

  @override
  void onClose() {
    super.onClose();
    advancedPlayer?.dispose();
  }
}
