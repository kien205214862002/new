import 'package:familiar_stranger_v2/services/api.dart';
import 'package:get/get.dart';

class MusicController extends GetxController {
  RxList listMusic = [].obs;
  RxList listMusicSelected = [].obs;
  RxBool isPlaying = false.obs;
  RxBool isLoop = false.obs;
  RxBool isRandom = false.obs;

  void loadInitMusic() async {
    listMusic = [].obs;
    await getAllSong();
  }

  void selectSong(song) {
    listMusicSelected.add(song);
    update(['listMusicSelected']);
  }

  void PlayMusic() {
    isPlaying.toggle();
  }

  void PauseMusic() {
    isPlaying.toggle();
  }

  void loopMusic() {
    isLoop.toggle();
  }

  void randomMusic() {
    isRandom.toggle();
  }
}
